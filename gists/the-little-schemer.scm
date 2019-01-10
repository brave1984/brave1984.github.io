#! /usr/bin/scheme --script

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))


(define lat?
  (lambda (l)
    (cond
      [(null? l) #t]
      [(atom? (car l)) (lat? (cdr l))]
      [else #f])))


(define member?
  (lambda (a lat)
    (cond
      [(null? lat) #f]
      [else (or (eq? (car lat) a)
		(member? a (cdr lat)))])))


(define rember
  (lambda (a lat)
    (cond
      [(null? lat) '()]
      [(eq? (car lat) a) (cdr lat)]
      [else (cons (car lat)
		  (rember a (cdr lat)))])))



(define first
  (lambda (l)
    (cond
      [(null? l) '()]
      [else (cons (car (car l))
		  (first (cdr l)))])))


(define insertR
  (lambda (new old lat)
    (cond
      [(null? lat) '()]
      [(eq? (car lat) old)
       (cons old
	     (cons new (cdr lat)))]
      [else (cons (car lat)
		  (insertR new old (cdr lat)))]))) 


(define insertL
  (lambda (new old lat)
    (cond
      [(null? lat) '()]
      [(eq? (car lat) old)
       (cons new
	     (cons old (cdr lat)))]
      [else (cons (car lat)
		  (insertL new old (cdr lat)))])))


(define subst
  (lambda (new old lat)
    (cond
      [(null? lat) '()]
      [(eq? (car lat) old)
       (cons new (cdr lat))]
      [else (cons (car lat)
		  (subst new old (cdr lat)))])))

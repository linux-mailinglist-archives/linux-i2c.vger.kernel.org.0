Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6766EA5D5
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Apr 2023 10:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230428AbjDUI2e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Apr 2023 04:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjDUI23 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Apr 2023 04:28:29 -0400
X-Greylist: delayed 1000 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 21 Apr 2023 01:28:28 PDT
Received: from mail.loanfly.pl (mail.loanfly.pl [141.94.250.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD45C19B1
        for <linux-i2c@vger.kernel.org>; Fri, 21 Apr 2023 01:28:28 -0700 (PDT)
Received: by mail.loanfly.pl (Postfix, from userid 1002)
        id B039BA748D; Fri, 21 Apr 2023 08:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=loanfly.pl; s=mail;
        t=1682064672; bh=flSgn4+IJB03yMaHNopPnR0v50wun3P5Hd/CkHJx2Bc=;
        h=Date:From:To:Subject:From;
        b=HvqF7Xs3qIiut3HOpdr8v1WVxCtZBdDoWjcQvOjPWx2cOTtAFebyECyOd7GJwcEfc
         w483GYA7+xurW061Z5CbXDRlzI8BxttLkV4MoaxkLlKywxGN5dDr7bBRBPfbS9VZEL
         7YMmlR8ebzKTj7wCMb86OvjlAbzrgQuPOB4/eAQaTe6sOV7rcwZbNNaCb8Cc5aCw8l
         zntjVe38GQtD/794kcCUo6qTnFTj1X8hsTe57g/g/WnHqVSpYE3/cDbxYC6uUsWtAf
         a0pmRhFyt2ZfnS21F/M96Nej6PliXy0vpzlmHSwvBYYE61MXKmuHB3j7R9W24XSyM0
         pqnhtBhhGt6LA==
Received: by mail.loanfly.pl for <linux-i2c@vger.kernel.org>; Fri, 21 Apr 2023 08:11:01 GMT
Message-ID: <20230421064500-0.1.9p.15di5.0.n5061gop1l@loanfly.pl>
Date:   Fri, 21 Apr 2023 08:11:01 GMT
From:   "Damian Cichocki" <damian.cichocki@loanfly.pl>
To:     <linux-i2c@vger.kernel.org>
Subject: Prezentacja
X-Mailer: mail.loanfly.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_ABUSE_SURBL,URIBL_BLOCKED,
        URIBL_CSS_A,URIBL_DBL_SPAM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: loanfly.pl]
        * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
        *      [score: 0.0000]
        *  2.5 URIBL_DBL_SPAM Contains a spam URL listed in the Spamhaus DBL
        *      blocklist
        *      [URIs: loanfly.pl]
        *  1.2 URIBL_ABUSE_SURBL Contains an URL listed in the ABUSE SURBL
        *      blocklist
        *      [URIs: loanfly.pl]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [141.94.250.68 listed in zen.spamhaus.org]
        *  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
        *      blocklist
        *      [URIs: loanfly.pl]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dzie=C5=84 dobry!

Czy m=C3=B3g=C5=82bym przedstawi=C4=87 rozwi=C4=85zanie, kt=C3=B3re umo=C5=
=BCliwia monitoring ka=C5=BCdego auta w czasie rzeczywistym w tym jego po=
zycj=C4=99, zu=C5=BCycie paliwa i przebieg?

Dodatkowo nasze narz=C4=99dzie minimalizuje koszty utrzymania samochod=C3=
=B3w, skraca czas przejazd=C3=B3w, a tak=C5=BCe tworzenie planu tras czy =
dostaw.

Z naszej wiedzy i do=C5=9Bwiadczenia korzysta ju=C5=BC ponad 49 tys. Klie=
nt=C3=B3w. Monitorujemy 809 000 pojazd=C3=B3w na ca=C5=82ym =C5=9Bwiecie,=
 co jest nasz=C4=85 najlepsz=C4=85 wizyt=C3=B3wk=C4=85.

Bardzo prosz=C4=99 o e-maila zwrotnego, je=C5=9Bli mogliby=C5=9Bmy wsp=C3=
=B3lnie om=C3=B3wi=C4=87 potencja=C5=82 wykorzystania takiego rozwi=C4=85=
zania w Pa=C5=84stwa firmie.


Pozdrawiam,
Damian Cichocki

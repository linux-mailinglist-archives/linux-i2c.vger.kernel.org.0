Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68BCE218DD0
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jul 2020 19:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730178AbgGHRDB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jul 2020 13:03:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbgGHRC7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jul 2020 13:02:59 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89C2AC08C5C1
        for <linux-i2c@vger.kernel.org>; Wed,  8 Jul 2020 10:02:59 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id lx13so32662007ejb.4
        for <linux-i2c@vger.kernel.org>; Wed, 08 Jul 2020 10:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=SKFWZP+CSq+jnCLnDC2yCG5r1uzLqSVOd8WmlvY5ig8=;
        b=LRT7HiRmDq9OvwzOSUHR+fgHcu8jBkKYJkQIGkWIKlJltuTHaEiaMP8wqbgF/qW7c2
         ksS81M1VTFMns7e+R5dDUEDur3rPbsvRVXeNgoh6LXqY/xWPXEN0vafRdG/hTc/nB+8d
         BsaEEPkjo38N13VZAekVEauXU7TDre3JJnZsJ5yUwC5qKbJojtYpuflxwCh5YDi0J06F
         LbpHy1xlulSck12J8u7Pe/I+VxJ5F8eG7fLg1FENiL5crgk8aKAiOZRAK8wFp30ESFG0
         8mJYm1t6u0aF0l2Sk6zR1OG4gzA38yjsMzla28FQnK1hDmYSMxJc1Jkdw7ougSAcF6lk
         ezeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=SKFWZP+CSq+jnCLnDC2yCG5r1uzLqSVOd8WmlvY5ig8=;
        b=qOh/D3pm0ruwpzyvtV9eFC+c1QZ+8Po56r3VWPOl94GJ4vU6KJH/k7o5T9cUtw83xW
         YlMZvtXg0STo6lxnbgsmKepkZA5pKTUa0yc+DKub2F/YcjQu8KGD6DLServS49iiYyGa
         RT+K9va6dVzB+NOXGu9Yxfb7R7vzeRs6cv3XEw2C1LcvGciuOJI3KIGEmyWIM1HoEC+s
         L/rXW2HSW7lcjybLhb3XjzY+zfoNnByTkMl9V9AutzH1u1c6I7Hudhgw/o0zP4mp6Ak+
         3lQVfnMX0DvL3y2jcGm0ITKzg3IbC3ocEJfJ+AcEJW6h7ZCJiIMEqBfaLbObEY9OOtpK
         883g==
X-Gm-Message-State: AOAM5332J48tLRcefI8KLrF7IpLwHq/5rqHqQibPn7QjYgaUIYXD5/CT
        eqFQGFmgqFnFH/1V2GR/Jy0C44pXwS2aWxmN7N0=
X-Google-Smtp-Source: ABdhPJxt9b6zP1fmtNw8SVXNxlUdQ/x3SuU8c2nqXRPZ+mQOBvm1HVDUoXE4uMXGUIFbBBjKFM9Q8DAN+OnxgNXzrcw=
X-Received: by 2002:a17:906:547:: with SMTP id k7mr51519296eja.287.1594227778176;
 Wed, 08 Jul 2020 10:02:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:c194:0:0:0:0 with HTTP; Wed, 8 Jul 2020 10:02:57
 -0700 (PDT)
From:   Danita Farouk <Danitafarouk@gmail.com>
Date:   Wed, 8 Jul 2020 17:02:57 +0000
X-Google-Sender-Auth: Xi98lUh-AAgtspRS7RXaQy8RACg
Message-ID: <CAG=Ecz0vL8E+An9tx6z9JjtfLQtinHUbGcpB4i6zTcDRkpyQBA@mail.gmail.com>
Subject: Please I want your sincerely and urgent answer
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

May the peace of God be with you,

My dear, I am writing this mail to you with heavy sorrow in my heart,
this massage mighty comes to you as a surprise but I chose to reach
you through this email because it still remains the fastest medium of
communicating with you. Please give me this little chance to explain
myself to you, I would have like to meet you in person before
departing from this mother earth but due to the illness continue to
deprive me the chance but even if I die on the process of this illness
I will still praise ALMIGHTY God.

First let me kindly introduce myself to you my names are Mrs. Danita
Farouk, I am a dying woman diagnosed of cancer for about 1 year ago,
immediately after the death of my beloved husband, who has left me
everything he worked with and an bank deposit of the sum of (Eleven
Million Four Hundred Thousand Dollars) with my name as the legal
rightful appointed beneficiary to the fund. But /next of kin=E2=80=99s
according to my doctor he told me that I would not last for a long
period of time because this illness has gotten to a very bad stage.
That is the reason why i decided to entrust my inheritance money to
you, I hoped that you will not expose or betray this trust and
confident that I am about to repose on you for the mutual benefit of
the orphans and the less privileges ones, believing that you will
utilize the money the way i am going to instruct herein as i mentioned
above. I need you to assist me to reclaim this money from the bank
where it's been deposited by my late husband and use the fund for
Charity works in your position before I die, such as orphanages and
gives justice and help to the poor, needy, elderly ones and the widow
says The Lord." Jeremiah 22:15-16.=E2=80=9C to promote the word of god and =
the
effort that the house of god is maintained.

I do not want a situation where this money will be used in an ungodly
manner. That's why I'm taking this decision. I'm not afraid of death,
so I know where I'm going. I accept this decision because I do not
have any child who will inherit this money after I die. To be very
honest with you, this money I have opened-up to you is totally genuine
no complications and is 100% risk-free. I am absolutely assuring you
that no problem involved in this fund either in the short-run or in
the long-run because i am the legal rightful appointed next of kin's
to the fund everything is legitimate.

And it will be my great pleasure to compensate you with 35 % percent
of the total money for your personal use, 5 % percent for any expenses
that may occur during the transaction and while 60% of the money will
go to the charity project OR better still you can invest the total
fund into your personal business ventures and make sure you assist the
orphanages and the less privileged and do other Charitable works with
the profit you will make from the business. I will appreciate your
utmost confidentiality and trust in this matter to accomplish my heart
desire, as I don't want anything that will jeopardize the fund my late
husband has worked for and my last wish. Upon your reply, I will give
you more details and the bank contact information including my late
husband account details also a letter of authorization which will
enable you proceed communication with the bank for the claim of the
fund as the rightful legal present beneficiary of the fund. All I need
from you is sincerity and ability to complete God task without any
failure.

It will be my pleasure to see that the bank has release and transfer
the fund into your bank account therein country even before I die here
in the hospital. Because of my present health status everything need
to be process rapidly as soon as possible. Please kindly respond
quickly. Thanks and God bless you,

May God Bless you for your kind help.
Yours sincerely sister Mrs. Danita Farouk.

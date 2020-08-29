Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4110B256704
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Aug 2020 13:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbgH2LME (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Aug 2020 07:12:04 -0400
Received: from sonic302-2.consmr.mail.bf2.yahoo.com ([74.6.135.41]:35881 "EHLO
        sonic302-2.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726876AbgH2LME (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 29 Aug 2020 07:12:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1598699522; bh=4GgFxXkhC86dj48BmrELV5zlxicqlhhIXyZgiwEolDI=; h=Date:From:Reply-To:Subject:References:From:Subject; b=OODsiAEJpnN2qqR2oaaR5Iq/DK1XLZbqtHw99mF805uZcDqnQrqFbbp7TPmGKzS1ya6JNEt8HpZFi+gBMVvpw8mpgp6ciubo1dFiUnzFjDnP09GtOPObRSCB272/wWkBPfkivSiNrZQ2A0kQHpwzStxHmwlxnPOyDZC+4m26bsUeNLm4hQuqvk7zkuYavkJstdyJvx8AfZrl3LZx3WiVCBoEVU1GonFJygtj2jQUrsMAMGvpzEFL42ixthpfTUBs757Bdih/DEJqnwNoiHayhkGNy6PZwHEkxEzL8BgSVeMZjIIGm+cgRH5Bh3MhNOYwC5YvxP5RhVoOb+a2tJ8GwQ==
X-YMail-OSG: q.wXI_8VM1kpEerQMhtO_CeFFtsyoILbYaoMqqfxbsDY5UBAgXdDtMH5HgC3ddA
 7BnrN94gZV_NZQ3CSPILGKqubgMq2iFAnqRgido0dZ2Yq6b9PzKzcDAfKKN75NK7rJmLcV62035D
 .8.sgDU3vGButPxRKCgU_HSBu3Mrz2uzcUczHU5ndDBFA4gLR9sSGSBj2OaMu8slebIP1qSnFUbk
 wZIx1LhKIfscaKuMrVBTCKUaiCDVCIrbxlO6TvFUFGY_2SFyzE5wKDAMREASAhf05YNAh5r5qE09
 gPFTDUXfy2Jsd5zHbHl067AdQdX3jOhSWozwqNaVMvzOUXrIpE.hkyxEbodDQOQX_HKUqoy9dmmQ
 9W0d6HfFz5tUY9xMJRoICfniTnNxrbF6M0zMWmM7x_gv1NOe0IhSKWv8l0yH2LZZI4jimBRi0Nse
 CEz5rG8aN414yIhExJB74OZZYRbazHU3_vRwT3SikWC41mtuB1KPJBiNDUZrvQVxx84o8dLpADbP
 TRu4Id42_vxwHH4ifXNYU5LvkdTkYfwOIS5Ai0BygScfAMmrt2i8QWURcrGu.jgoe4grOROOU1VD
 qG4u.ceB6GOG1Zfi57nFLCWKB55N1woY6sUfFduQ5KPiPZsy7.2p6UBZBpvILzGTrnro9g3J.LQn
 OCxeoyTkb5EWUwRNfdQxGL9NwIjI2RBPghvyZEiHs5B9Am2lRxGrbOcQcZB1g5BHe8WmE2KDhGCv
 gPLZv4SzJQn2BemaLR.pTPF6ggy1ZcXftfmV4LlRRTZwmkjMLd683SAu9N4eOteEUIhERyLiVg2n
 v3U4bzxkRH.c7zQRdQlFMr7wE4zOSq1Fc6WTXWNrTkWq4wIuouBtmQe.aE0MdZK5XMaODh2IzmZ3
 lQ2VR9zmblIX1M3h0jMLsLM5Sa4kYIzE1JozJmE.uWzANJ_GYvtYqNoeKK6oFwRfxbcR5BG2AcCh
 04yUeoFgsRB2remIRKfI6B5rSYxQqcaVLkWWo63RnKyjSCSSb.qMvQftGJ_gv266f932D.SoX0vC
 T8qzTKHSmzT.hCGFhxQM1Dcv_rArhZDeMCT9lk_n5JvRfdaVia98ZNDBVOL2v4TNhMcqqc.AVV_3
 P42Ne_eOwipq2HETVPovhEWhfsf8PvLFbL.aQhiSQ1wUEEuFY4rSA8.mJwuzV4rjsfMamPzt6JFI
 8V1QvVBkE.I.u7exI9uUNHray61a8c6BZrBjH5MRf8NGfEouEz0EmuzeuJbRbiFtnQU5ivVQw1TB
 6yQBilhNw1UoJBQS8Ybi8swdZqCeQ0xTMB5PeoEr8ZQfKOiuQlv.AoRb5fiUFwfXoV4xE0tkqHSf
 wBYpqYqv3falN2DRcxIGYgrbZZPa_tSf4qHWYj4eFOmuboo5LjieYuJdqlmejab9YLTa6fXkOTRb
 r0QGywx.HO6VDbVaoRjPDkTqQ7km4xq1EvpkHuw--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.bf2.yahoo.com with HTTP; Sat, 29 Aug 2020 11:12:02 +0000
Date:   Sat, 29 Aug 2020 11:12:01 +0000 (UTC)
From:   Zeena Hamad <zeena.hamad121@aol.com>
Reply-To: zeenahamad@aol.com
Message-ID: <1857060588.84039.1598699521040@mail.yahoo.com>
Subject: Hello Dear.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1857060588.84039.1598699521040.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16565 YMailNodin Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Dear,

How are you today, I hope you are doing great. It is my great pleasure
to contact you and i hope you don't mind, I was just surfing through
the Internet search when I found your email address, I want to make a
new and special friend, I hope you don't mind.

My name is Zeena Hamad, I am from the South Sudan but presently
I live in a mission house in Burkina Faso and I will give you pictures
and details of me as soon as I hear from you.

Bye

Zeena Hamad

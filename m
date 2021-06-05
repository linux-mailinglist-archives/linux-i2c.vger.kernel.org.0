Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E16039C605
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Jun 2021 07:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbhFEFTY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Sat, 5 Jun 2021 01:19:24 -0400
Received: from mail.sch.bme.hu ([152.66.249.140]:16984 "EHLO mail.sch.bme.hu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229544AbhFEFTX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 5 Jun 2021 01:19:23 -0400
Received: from mail-lj1-f181.google.com (209.85.208.181) by
 Exchange2016-1.sch.bme.hu (152.66.249.140) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.14; Sat, 5 Jun 2021 07:17:35 +0200
Received: by mail-lj1-f181.google.com with SMTP id n24so74169lji.2;
        Fri, 04 Jun 2021 22:17:35 -0700 (PDT)
X-Gm-Message-State: AOAM5332Xluz9iJEaAXybUoqjSviRuja7yXM8Iw9ubsRyQPWaqKuB6Pk
        MfJNDjt7d8LsWJEpsPqCZtHiPkAhJpua+WvxHVo=
X-Google-Smtp-Source: ABdhPJw5LFtYMOrygotozaR7xW0HDr+ScX/qniX2SReclZzmD6wvdVrcqrdjh8JymwxezCLedK8bphcMh4WAugo6wP0=
X-Received: by 2002:a2e:7f16:: with SMTP id a22mr6185676ljd.360.1622870254662;
 Fri, 04 Jun 2021 22:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <YJuosd6rew91vlyX@mwanda> <YLqQw6Yc07RecKZs@kunai>
In-Reply-To: <YLqQw6Yc07RecKZs@kunai>
From:   =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>
Date:   Sat, 5 Jun 2021 07:17:23 +0200
X-Gmail-Original-Message-ID: <CACCVKEHuT9gHYazLt7+RFrP7hBJCZvisstJay_DEweGGKx6svA@mail.gmail.com>
Message-ID: <CACCVKEHuT9gHYazLt7+RFrP7hBJCZvisstJay_DEweGGKx6svA@mail.gmail.com>
Subject: Re: [PATCH] i2c: cp2615: check for allocation failure in cp2615_i2c_recv()
To:     Wolfram Sang <wsa@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>,
        <linux-i2c@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [209.85.208.181]
X-ClientProxiedBy: Exchange2016-1.sch.bme.hu (152.66.249.140) To
 Exchange2016-1.sch.bme.hu (152.66.249.140)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Sure, though I had hoped Dan would update his patch so that all
allocation failures return -ENOMEM... Oh well.

Signed-off-by: Bence Csókás<bence98@sch.bme.hu>


Wolfram Sang <wsa@kernel.org> ezt írta (időpont: 2021. jún. 4., P 22:45):
>
> On Wed, May 12, 2021 at 01:06:41PM +0300, Dan Carpenter wrote:
> > We need to add a check for if the kzalloc() fails.
> >
> > Fixes: 4a7695429ead ("i2c: cp2615: add i2c driver for Silicon Labs' CP2615 Digital Audio Bridge")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Bence, are you okay with applying this patch as it fixes a bug?
>

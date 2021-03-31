Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F101350622
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 20:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234641AbhCaSS3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 31 Mar 2021 14:18:29 -0400
Received: from mail.sch.bme.hu ([152.66.249.140]:57922 "EHLO mail.sch.bme.hu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233934AbhCaSR5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 14:17:57 -0400
Received: from mail-lj1-f177.google.com (209.85.208.177) by
 Exchange2016-1.sch.bme.hu (152.66.249.140) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.2; Wed, 31 Mar 2021 20:17:48 +0200
Received: by mail-lj1-f177.google.com with SMTP id a1so24990905ljp.2;
        Wed, 31 Mar 2021 11:17:48 -0700 (PDT)
X-Gm-Message-State: AOAM5310OX/qhNEIZhDOh3OCI3AMQPg8M5eniuLCY8M2npC3zTXECgZk
        d2Z5gt07ED8FljckV6CGR+Vd+/PUVYFpM42eNd0=
X-Google-Smtp-Source: ABdhPJzx3wxkCzuYO5aYQUbXVGrAPwFSBXqyDkfqbFokvamM6BMLO9tkIe5M5Rd/aoMSmHsfwgWdaH6n3e9p20Pn/IA=
X-Received: by 2002:a05:651c:124b:: with SMTP id h11mr2852209ljh.401.1617214668164;
 Wed, 31 Mar 2021 11:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210318115210.2014204-1-bence98@sch.bme.hu> <20210318115210.2014204-3-bence98@sch.bme.hu>
 <20210331095820.GA29323@ninjato>
In-Reply-To: <20210331095820.GA29323@ninjato>
From:   =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>
Date:   Wed, 31 Mar 2021 20:17:36 +0200
X-Gmail-Original-Message-ID: <CACCVKEHYdUgx1QuJqUz3=OettOJHQWuA1O+ve1ZUDPAWz+n0aA@mail.gmail.com>
Message-ID: <CACCVKEHYdUgx1QuJqUz3=OettOJHQWuA1O+ve1ZUDPAWz+n0aA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] Adding i2c-cp2615: i2c support for Silicon Labs'
 CP2615 Digital Audio Bridge
To:     Wolfram Sang <wsa@kernel.org>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [209.85.208.177]
X-ClientProxiedBy: Exchange2016-1.sch.bme.hu (152.66.249.140) To
 Exchange2016-1.sch.bme.hu (152.66.249.140)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> drivers/i2c/busses/i2c-cp2615.c:88:21: warning: incorrect type in assignment (different base types)
> drivers/i2c/busses/i2c-cp2615.c:88:21:    expected unsigned short [usertype] length
> drivers/i2c/busses/i2c-cp2615.c:88:21:    got restricted __be16 [usertype]
> ...
Yes, I have already converted to using __be16 where needed, it will be
in the next version of the patch I send.

> drivers/i2c/busses/i2c-cp2615.c:78:5: warning: symbol 'cp2615_init_iop_msg' was not declared. Should it be static?
> drivers/i2c/busses/i2c-cp2615.c:96:5: warning: symbol 'cp2615_init_i2c_msg' was not declared. Should it be static?
> drivers/i2c/busses/i2c-cp2615.c:102:5: warning: symbol 'cp2615_check_status' was not declared. Should it be static?
I can forward declare these (copying from the header I used in v1 of
the patch), but I'm not sure I understand the rationale behind these
warnings...
> drivers/i2c/busses/i2c-cp2615.c:212:27: warning: symbol 'cp2615_i2c_quirks' was not declared. Should it be static?
Especially this. I think I will make this static instead, since it
won't ever be exported to any other module.

> The missing 'static' are what buildbot also reported and are correct.
The lkp bot complained about MODULE_DEVICE_TABLE and MODULE_AUTHOR,
which, again, I don't see what is wrong with it.

> drivers/i2c/busses/i2c-cp2615.c:244:2: warning: ‘strncpy’ specified bound 48 equals destination size [-Wstringop-truncation]
I thought this was the correct way of strncpy... Time to RTFM then, I guess :)

> Oh, and are you willing to maintain the driver? If so, please add an
> entry to the MAINTAINERS file. Thanks!
Sure!

I will now send an updated patch, with  few additions too.

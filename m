Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB7587935DD
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 09:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbjIFHDX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Sep 2023 03:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjIFHDV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Sep 2023 03:03:21 -0400
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0976ACFD;
        Wed,  6 Sep 2023 00:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
        s=default2211; h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
        In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID; bh=aUZigaIDl455uJFfM4atCFTc6YhwYkbBmi5D3Xd9bXo=;
        b=bYMDk1tPSG6XcswwgitD4eqE3rSN6NMTKGbo7NKOr9+fvT1zazrwlZLXlk1vtq9Yj5m3zK8HhFr
        y12JaKP9Ma9UPQea1q2xLts73qU7gZ01WmuLshvD8f8pE3BHviF292FP0F4Wvqq0RFJmT31bzWlxT
        UHbmnwvR97hvqcaZL1Di0gRr6GdaDEb6Tn4HTu0PTXSObFeORMIT8Fhu9qgI1Ycd6O1qTGJ3heNyq
        YaHPaRXQX+g/7dP76tZbASISap3uV2yo80VH9DCKSX9+TyUok4iPyKfjl4n3KqhTrFOKrasvxi3m9
        AwhTjRWByj7xpzYcgvH8xslptUM0chRZZUNA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
        by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <sean@geanix.com>)
        id 1qdmZF-000Ds6-VT; Wed, 06 Sep 2023 09:03:13 +0200
Received: from [2a06:4004:10df:0:6ddf:934f:689b:4300] (helo=smtpclient.apple)
        by sslproxy05.your-server.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.92)
        (envelope-from <sean@geanix.com>)
        id 1qdmZF-000Ul9-8A; Wed, 06 Sep 2023 09:03:13 +0200
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH v3] i2c: stm32f7: Add atomic_xfer method to driver
From:   Sean Nyekjaer <sean@geanix.com>
In-Reply-To: <20230905230821.h7a7thjgm2do3w64@zenone.zhora.eu>
Date:   Wed, 6 Sep 2023 09:03:02 +0200
Cc:     Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <2356AD12-9631-4707-8EA5-385E9D6A5716@geanix.com>
References: <20230816080552.3045491-1-sean@geanix.com>
 <20230903124620.6yrnpbpj37on6wih@zenone.zhora.eu>
 <6A1B6BF0-C298-43D3-9B63-0FB1EC9E902B@geanix.com>
 <20230905230821.h7a7thjgm2do3w64@zenone.zhora.eu>
To:     Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>
X-Mailer: Apple Mail (2.3731.700.6)
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/27022/Tue Sep  5 09:59:33 2023)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andi,

> On 6 Sep 2023, at 01.08, Andi Shyti <andi.shyti@kernel.org> wrote:
>=20
> Hi Sean,
>=20
> On Mon, Sep 04, 2023 at 07:29:59AM +0200, Sean Nyekjaer wrote:
>> Hi Andy,
>>=20
>>> On 3 Sep 2023, at 14.46, Andi Shyti <andi.shyti@kernel.org> wrote:
>>>=20
>>> Hi Pierre-Yves, Alain,
>>>=20
>>> mind taking a look here?
>>>=20
>>> [...]
>>>=20
>>>> @@ -357,6 +357,7 @@ struct stm32f7_i2c_dev {
>>>> u32 dnf_dt;
>>>> u32 dnf;
>>>> struct stm32f7_i2c_alert *alert;
>>>> + bool atomic;
>>>=20
>>> this smells a bit racy here, this works only if the xfer's are
>>> always sequential.
>>>=20
>>> What happens when we receive at the same time two xfer's, one
>>> atomic and one non atomic?
>>=20
>> =46rom the include/i2c.h:
>> * @master_xfer_atomic: same as @master_xfer. Yet, only using atomic =
context
>> *   so e.g. PMICs can be accessed very late before shutdown. =
Optional.
>>=20
>> So it=E2=80=99s only used very late in the shutdown.
>>=20
>> It=E2=80=99s implemented the same way as in:
>> drivers/i2c/busses/i2c-imx.c
>> drivers/i2c/busses/i2c-meson.c
>> drivers/i2c/busses/i2c-mv64xxx.c
>> drivers/i2c/busses/i2c-tegra.c
>> =E2=80=A6 etc=E2=80=A6
>>=20
>>=20
>> In drivers/i2c/i2c-core.h it=E2=80=99s determined whether it=E2=80=99s =
atomic transfer or not:
>>=20
>> /*
>> * We only allow atomic transfers for very late communication, e.g. to =
access a
>> * PMIC when powering down. Atomic transfers are a corner case and not =
for
>> * generic use!
>> */
>> static inline bool i2c_in_atomic_xfer_mode(void)
>> {
>>        return system_state > SYSTEM_RUNNING && irqs_disabled();
>> }
>>=20
>> So you would not have an atomic transfer and later an non atomic.
>=20
> What about the opposite? I.e. a non atomic and later an atomic,
> for very late tardive communications :)

Sure it=E2=80=99s the opposite? Normal scenario is =E2=80=9Cnon =
atomic=E2=80=9D transfers going on and under shutdown it switches to =
=E2=80=9Catomic=E2=80=9D.
=46rom i2c_in_atomic_xfer_mode() it can=E2=80=99t go from =E2=80=9Catomic=E2=
=80=9D -> =E2=80=9Cnon atomic=E2=80=9D.

extern enum system_states {
SYSTEM_BOOTING,
SYSTEM_SCHEDULING,
SYSTEM_FREEING_INITMEM,
SYSTEM_RUNNING,
SYSTEM_HALT,
SYSTEM_POWER_OFF,
SYSTEM_RESTART,
SYSTEM_SUSPEND,
} system_state;

If you are asking what happens if a =E2=80=9Cnon atomic=E2=80=9D =
transfer is ongoing and irq=E2=80=99s is disabled, IDK.

Let=E2=80=99s get Wolfram in the loop (Sorry I forgot to add you) :)

/Sean


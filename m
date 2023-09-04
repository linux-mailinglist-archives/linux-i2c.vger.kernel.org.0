Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE1E17910EE
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Sep 2023 07:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236146AbjIDFaX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Sep 2023 01:30:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235900AbjIDFaX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Sep 2023 01:30:23 -0400
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED70FF9;
        Sun,  3 Sep 2023 22:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
        s=default2211; h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
        In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID; bh=T3SiwA+nSrWJsUqWupq7/d/RhwtuVgONj1KxvBWGD9k=;
        b=Z1ah41nntYQGeWDepIDesE4iU1plC8jgCY//AX/UHd5Z92QgvJov+LEtn1+ChtJluc28vZy6PQz
        sD7WI/yIeYC48qNKrxagkbbG6uN3mUNdkdCz5wHIQD71K0d+I1SG42R6IVprvHhLfsqeKsbDgtWYl
        yuBKaH/ZyssIcTaqHA6rT9pFHjTNlZ9wT7fwCKPscXwlAHNlItBHw6Tw+d1ha+Cp56lFU364ctaPf
        9e9PUsVa5B+CCHHIx3CqXP7p7oUqcgwmCdngEOoMKFE7X/Jw+8cH2gtmIDHEL/Pnw+6bwytMTipGV
        MpAdoznskSSnQASrevU+RGQdUlrhjj6wdJrQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
        by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <sean@geanix.com>)
        id 1qd2A6-0002dP-Cc; Mon, 04 Sep 2023 07:30:10 +0200
Received: from [2a06:4004:10df:0:5108:a08f:8282:7512] (helo=smtpclient.apple)
        by sslproxy01.your-server.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.92)
        (envelope-from <sean@geanix.com>)
        id 1qd2A5-000VKP-MO; Mon, 04 Sep 2023 07:30:09 +0200
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH v3] i2c: stm32f7: Add atomic_xfer method to driver
From:   Sean Nyekjaer <sean@geanix.com>
In-Reply-To: <20230903124620.6yrnpbpj37on6wih@zenone.zhora.eu>
Date:   Mon, 4 Sep 2023 07:29:59 +0200
Cc:     Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6A1B6BF0-C298-43D3-9B63-0FB1EC9E902B@geanix.com>
References: <20230816080552.3045491-1-sean@geanix.com>
 <20230903124620.6yrnpbpj37on6wih@zenone.zhora.eu>
To:     Andi Shyti <andi.shyti@kernel.org>
X-Mailer: Apple Mail (2.3731.700.6)
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/27020/Sun Sep  3 09:38:16 2023)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

> On 3 Sep 2023, at 14.46, Andi Shyti <andi.shyti@kernel.org> wrote:
>=20
> Hi Pierre-Yves, Alain,
>=20
> mind taking a look here?
>=20
> [...]
>=20
>> @@ -357,6 +357,7 @@ struct stm32f7_i2c_dev {
>> u32 dnf_dt;
>> u32 dnf;
>> struct stm32f7_i2c_alert *alert;
>> + bool atomic;
>=20
> this smells a bit racy here, this works only if the xfer's are
> always sequential.
>=20
> What happens when we receive at the same time two xfer's, one
> atomic and one non atomic?

=46rom the include/i2c.h:
 * @master_xfer_atomic: same as @master_xfer. Yet, only using atomic =
context
 *   so e.g. PMICs can be accessed very late before shutdown. Optional.

So it=E2=80=99s only used very late in the shutdown.

It=E2=80=99s implemented the same way as in:
drivers/i2c/busses/i2c-imx.c
drivers/i2c/busses/i2c-meson.c
drivers/i2c/busses/i2c-mv64xxx.c
drivers/i2c/busses/i2c-tegra.c
=E2=80=A6 etc=E2=80=A6


In drivers/i2c/i2c-core.h it=E2=80=99s determined whether it=E2=80=99s =
atomic transfer or not:

/*
 * We only allow atomic transfers for very late communication, e.g. to =
access a
 * PMIC when powering down. Atomic transfers are a corner case and not =
for
 * generic use!
 */
static inline bool i2c_in_atomic_xfer_mode(void)
{
        return system_state > SYSTEM_RUNNING && irqs_disabled();
}

So you would not have an atomic transfer and later an non atomic.

/Sean=

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14B327825FD
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Aug 2023 11:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232438AbjHUJDX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Aug 2023 05:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231191AbjHUJDX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Aug 2023 05:03:23 -0400
Received: from mx4.sionneau.net (mx4.sionneau.net [51.15.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6661C1;
        Mon, 21 Aug 2023 02:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sionneau.net;
        s=selectormx4; t=1692608597;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iw4ecEer9Isr6y2xKA89Srysc83W6b+wq8dFy3tGUhQ=;
        b=QreADZUPv1U8ejTXiK3+DRmgWGNAT5j7y8BW5ogXcroXkJ1QuFj6b2BlGzupmWbbE/amC9
        6s2OysF+qR0WITOezFqBpXxhNjnTGfFvjEc5Ba0nn2+cFwrgAJUHR08nInVMsyviwd4Kna
        +JQiVwm61/TYFRsxhLWYTn3/4Wg/gv8=
Received: from tools.sionneau.net (tools.sionneau.net [163.172.149.114])
        by mx4.sionneau.net (OpenSMTPD) with ESMTPSA id 96cd665a (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO);
        Mon, 21 Aug 2023 09:03:17 +0000 (UTC)
Mime-Version: 1.0
Date:   Mon, 21 Aug 2023 09:03:17 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: RainLoop/1.11.3
From:   "Yann" <yann@sionneau.net>
Message-ID: <d9ea51b28fabdfd43570ccbe207b528c@sionneau.net>
Subject: Re: [PATCH v2] i2c: designware: add support for pinctrl for 
 recovery
To:     "Andi Shyti" <andi.shyti@kernel.org>
Cc:     "Jarkko Nikula" <jarkko.nikula@linux.intel.com>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        "Mika Westerberg" <mika.westerberg@linux.intel.com>,
        "Jan Dabros" <jsd@semihalf.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Yann Sionneau" <ysionneau@kalray.eu>
In-Reply-To: <20230820110158.sixmrcs5kbv3sof3@intel.intel>
References: <20230820110158.sixmrcs5kbv3sof3@intel.intel>
 <20230816095015.23705-1-yann@sionneau.net>
 <97d62909-551b-4abd-a743-5be09e617665@linux.intel.com>
 <685b10d2-7627-eea8-69e4-454af039fa5d@sionneau.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi, =0A=0AAugust 20, 2023 1:02 PM, "Andi Shyti" <andi.shyti@kernel.org> w=
rote:=0A=0A> Hi,=0A> =0A> On Thu, Aug 17, 2023 at 04:27:26PM +0200, Yann =
Sionneau wrote:=0A> =0A>> Hi=0A>> =0A>> Le 17/08/2023 =C3=A0 10:07, Jarkk=
o Nikula a =C3=A9crit :=0A>> Hi=0A>> =0A>> On 8/16/23 12:50, Yann Sionnea=
u wrote:=0A> =0A> From: Yann Sionneau <ysionneau@kalray.eu>=0A> =0A> Curr=
ently if the SoC needs pinctrl to switch the SCL and SDA=0A> from the I2C=
 function to GPIO function, the recovery won't work.=0A> =0A> scl-gpio =
=3D <>;=0A> sda-gpio =3D <>;=0A> =0A> Are not enough for some SoCs to hav=
e a working recovery.=0A> Some need:=0A> =0A> scl-gpio =3D <>;=0A> sda-gp=
io =3D <>;=0A> pinctrl-names =3D "default", "recovery";=0A> pinctrl-0 =3D=
 <&i2c_pins_hw>;=0A> pinctrl-1 =3D <&i2c_pins_gpio>;=0A> =0A> The driver =
was not filling rinfo->pinctrl with the device node=0A> pinctrl data whic=
h is needed by generic recovery code.=0A> =0A> Tested-by: Yann Sionneau <=
ysionneau@kalray.eu>=0A> Signed-off-by: Yann Sionneau <ysionneau@kalray.e=
u>=0A>> Tested-by from author is needless. Expectation is that author has=
 tested=0A>> the patch while not always true :-)=0A>> Ok, I just wanted t=
o emphasize the fact that I have the device and I tested=0A>> the change =
with the device. Ack!=0A> =0A> @@ -905,6 +906,15 @@ static int i2c_dw_ini=
t_recovery_info(struct=0A> dw_i2c_dev *dev)=0A> return PTR_ERR(gpio);=0A>=
 rinfo->sda_gpiod =3D gpio;=0A> + rinfo->pinctrl =3D devm_pinctrl_get(dev=
->dev);=0A> + if (IS_ERR(rinfo->pinctrl)) {=0A> + if (PTR_ERR(rinfo->pinc=
trl) =3D=3D -EPROBE_DEFER)=0A> + return PTR_ERR(rinfo->pinctrl);=0A> +=0A=
> + rinfo->pinctrl =3D NULL;=0A> + dev_info(dev->dev, "can't get pinctrl,=
 bus recovery might=0A> not work\n");=0A>> I think dev_dbg() suits better=
 here or is it needed at all? End user may=0A>> not be able to do anythin=
g when sees this in dmesg. I.e. more like=0A>> development time dev_dbg()=
 information.=0A>> I agree dev_dbg() is a better idea.=0A>> =0A>> Does i2=
c-core-base.c: i2c_gpio_init_pinctrl_recovery() already do=0A>> dev_info(=
) print when pinctrl & GPIO are set properly making above also=0A>> kind =
of needless?=0A>> =0A>> Thanks for the review. In fact I had to use gdb t=
o understand why the=0A>> recovery was not working. Because as you said, =
it only prints something to=0A>> say "everything looks ok!".=0A>> =0A>> I=
 kind of prefer when it prints when something goes wrong.=0A>> But I let =
you decide what you think is the best.=0A> =0A> You need to differentiate=
 here between an error and not an error.=0A> If the return value is an EN=
OMEM, then this is an error. Although=0A> I think you should not return, =
but the message needs to be an=0A> dev_err().=0A=0AAck.=0A> On the other =
hand, if the return value is a '0', then I think=0A> dev_info() is correc=
t.=0A=0AAck.=0A=0A> Either remove the logging or make it correct.=0A=0AI'=
ll print a dev_err in case of error (except for -EPROBE_DEFER) and a dev_=
info in case of NULL.=0A=0A> =0A> One more note, the sentence "can't get =
pinctrl,... " sounds like=0A> an error. If the pinctrl is not connected o=
n your system, maybe=0A> it's because your system is not designed to have=
 recovery. Please=0A> write a message that doesn't sound like an error (o=
r suppress the=0A> logging).=0A=0AI insist that I would have liked to see=
 a message in case of pinctrl setup failure whatever the reason, even if =
it's because CONFIG_PINCTRL is not set. That would be a "bug" for the dev=
eloper, in case he/she wants to have recovery working.=0ASometimes develo=
per just forget to enable the correct config or to put the correct stuff =
in DTB and printing debug messages really helps to understand what's goin=
g on.=0A=0ARegards, =0A=0A-- =0AYann

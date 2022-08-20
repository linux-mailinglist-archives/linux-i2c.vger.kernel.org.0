Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 478E459B056
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Aug 2022 22:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234015AbiHTURe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 20 Aug 2022 16:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiHTURe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 20 Aug 2022 16:17:34 -0400
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11CCC30570
        for <linux-i2c@vger.kernel.org>; Sat, 20 Aug 2022 13:17:33 -0700 (PDT)
Date:   Sat, 20 Aug 2022 20:17:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1661026648; x=1661285848;
        bh=KKmlMdBATxrw1fYuo6BKMHqUBdbBm2ifnz68GwDN770=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:
         Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
        b=ktXC7QeLApdlEuX8E4i5TioL2jUXuiPm1YNPiqPqZY+vvwFhCi6VCubuGbIrCBCas
         Szbhy0cwhZzpAimnhkMp88ncd54Mw4dfxZ0pqnarq/0WNsZ4wIhLEJfA70oHfn7fqM
         Xgnkof8cizyehXgeJ1Kt3Q40igXvNdrl4JfCoIug0lef0sLq7S3JH4oGVUl7ikvee1
         YWwS2YGiU3huLpUhsnw9Rk35IeGyIQF63xgiH7TVKaj94FWNF3Uwj2KyNzFtg3ne5Q
         JXb/oKV/iKvlcF9m57Vk/CKJshGcZQ6Eiza2rXDYOWXErmV8SN/7UT9V9oE1ZrHw4h
         XlTgvInkGZ2NQ==
To:     Arminder Singh <arminders208@outlook.com>
From:   =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Hector Martin <marcan@marcan.st>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org
Reply-To: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
Subject: Re: [PATCH] i2c: pasemi: Add IRQ support for Apple Silicon
Message-ID: <8387D093-6220-4849-9E09-D856A4362E97@protonmail.com>
Feedback-ID: 6533334:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


> On 20. 8. 2022, at 21:45, Arminder Singh <arminders208@outlook.com> wrote=
:
>
> This is the first time I'm interacting with the Linux mailing lists, so
> please don't eviscerate me *too much* if I get the formatting wrong.
> Of course I'm always willing to take criticism and improve my formatting
> in the future.
>
> This patch adds support for IRQs to the PASemi I2C controller driver.
> This will allow for faster performing I2C transactions on Apple Silicon
> hardware, as previously, the driver was forced to poll the SMSTA register
> for a set amount of time.
>
> With this patchset the driver on Apple silicon hardware will instead wait
> for an interrupt which will signal the completion of the I2C transaction.
> The timeout value for this completion will be the same as the current
> amount of time the I2C driver polls for.
>
> This will result in some performance improvement since the driver will be
> waiting for less time than it does right now on Apple Silicon hardware.
>
> The patch right now will only enable IRQs for Apple Silicon I2C chips,
> and only if it's able to successfully request the IRQ from the kernel.
>
> =3D=3D=3D Testing =3D=3D=3D
>
> This patch has been tested on both the mainline Linux kernel tree and
> the Asahi branch (https://github.com/AsahiLinux/linux.git) on both an
> M1 and M2 MacBook Air, and it compiles successfully as both a module and
> built-in to the kernel itself. The patch in both trees successfully boots
> to userspace without any hitch.
>
> I do not have PASemi hardware on hand unfortunately, so I'm unable to tes=
t
> the impact of this patch on old PASemi hardware. This is also why I've
> elected to do the IRQ request and enablement on the Apple platform driver
> and not in the common file, as I'm not sure if PASemi hardware supports
> IRQs.
>
> I also fixed a quick checkpatch warning on line 303. "i ++" is now "i++".
>
> Any and all critiques of the patch would be well appreciated.
>
>
>
>
> Signed-off-by: Arminder Singh <arminders208@outlook.com>

Thanks for the patch!

Tested-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>

on Mac mini (2020) with M1, with in-kernel WIP sound drivers.

Some timing comparison on boot logs follows, three runs with
and without the patch.

With:

[    0.631034] ALSA device list:
[    0.631403]   #0: Mac mini J274 integrated audio

[    0.625559] ALSA device list:
[    0.625997]   #0: Mac mini J274 integrated audio

[    0.624561] ALSA device list:
[    0.624913]   #0: Mac mini J274 integrated audio

Without:

[    0.681599] ALSA device list:
[    0.682051]   #0: Mac mini J274 integrated audio

[    0.677538] ALSA device list:
[    0.677968]   #0: Mac mini J274 integrated audio

[    0.686037] ALSA device list:
[    0.686400]   #0: Mac mini J274 integrated audio

(After I collected these I realised I don=E2=80=99t know to what exactly
the timing of the print is anchored, but anyway it still suggests
there is speed-up.)

Best,
Martin



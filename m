Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 936C25B68A8
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Sep 2022 09:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbiIMH2M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Sep 2022 03:28:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbiIMH2L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Sep 2022 03:28:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF60F419B8;
        Tue, 13 Sep 2022 00:28:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4A6C7612E7;
        Tue, 13 Sep 2022 07:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF397C433D6;
        Tue, 13 Sep 2022 07:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663054089;
        bh=V+0RnDg7bOwumzIae0Rp19hgVWwVgZ6XqH36wihmwxc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q30vIdk1Gwn8+shFD1HDdcAMFdb8rjtsUEh+o58LBi0tqviyNhWd8fRBQxZlNYSvh
         +3v4Hb1vxhcmKo03oMRm0jC2FCWdGGI4sROoTgrdjII2Ta/32oqjq10O23zD5NvOVq
         0367ebmq40LDZ3msYuCoZ0S5hH/QOSkmqDvzzzX7MWbl+rm/+29CceS6vWxG/Z/6jm
         ByY9FYlrxC/DANVo3Kw2zc8b8vPs7mAtJcni0++xoOWDyWiLjvPs6HbeYc0/8WcWBM
         g0/3tdpoo/MVZl4rPwcXLbcwrJJsO6nS4uddUDda6k386yMUwetZ2uBVBHGsW0B+ga
         e4Rv4f166zTPw==
Date:   Tue, 13 Sep 2022 08:28:06 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Raul E Rangel <rrangel@chromium.org>
Cc:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, jingle.wu@emc.com.tw,
        mario.limonciello@amd.com, timvp@google.com,
        linus.walleij@linaro.org, hdegoede@redhat.com, rafael@kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/13] i2c: acpi: Use ACPI wake capability bit to set
 wake_irq
Message-ID: <YyAxBtAD2wL91quT@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Raul E Rangel <rrangel@chromium.org>, linux-acpi@vger.kernel.org,
        linux-input@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        jingle.wu@emc.com.tw, mario.limonciello@amd.com, timvp@google.com,
        linus.walleij@linaro.org, hdegoede@redhat.com, rafael@kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220912221317.2775651-1-rrangel@chromium.org>
 <20220912160931.v2.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3UTJQ9CDOp2Ojq2j"
Content-Disposition: inline
In-Reply-To: <20220912160931.v2.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3UTJQ9CDOp2Ojq2j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 12, 2022 at 04:13:11PM -0600, Raul E Rangel wrote:
> Device tree already has a mechanism to pass the wake_irq. It does this
> by looking for the wakeup-source property and setting the
> I2C_CLIENT_WAKE flag. This CL adds the ACPI equivalent. It uses the
> ACPI interrupt wake flag to determine if the interrupt can be used to
> wake the system. Previously the i2c drivers had to make assumptions and
> blindly enable the wake IRQ. This can cause spurious wake events. e.g.,
> If there is a device with an Active Low interrupt and the device gets
> powered off while suspending, the interrupt line will go low since it's
> no longer powered and wakes the system. For this reason we should
> respect the board designers wishes and honor the wake bit defined on the
> interrupt.

I'll let the I2C ACPI maintainers deal with the technical details
because they are the experts here, yet one minor thing hits my eye:

> +		irq_ctx.irq = acpi_dev_gpio_irq_get_wake(
> +			adev, 0, &irq_ctx.wake_capable);

That line split looks weird with the open parens at the end of line 1.


--3UTJQ9CDOp2Ojq2j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMgMQYACgkQFA3kzBSg
KbYLBQ//Uku0QuXy5XdPydAmO+biFM9Altxe0Nc4C7FbC6F9L6ekiQHwSsPcOXCp
9YMprziLx5LQAkPzJI9dxxmmDzuYktPmtEKWidU8R5DB9M6PgRSg4wT+dKSFPrhA
n6+qIfOVHSC6Kvi4I3rV6tFwRKFTC3nN05eB3BeLrFTKbW9S1N1yFqYYwu2Ry7gr
BIIvJjgNeSZmuaFhYK92GGTD/2IuYNGCWdHuupBRIJxHM5ZNQv1SedLm7hfjBUvH
WcFUrDqJSgXf+7BF+YtC3jsyjPZmPpDeOWa0xyOItm3A9s7murjTyJNePQerzrYh
RKLiaiVVc+qhElONvHUcgJp3NqbelEMUfRJowkJXZcIhwzg/L1xQRN7kUCF+yKlZ
wEjk0VJ11ttx7QNoAawlgH4XZDrJcZgQVckYx7qv342HTvi8xO8PX9cTVz3X0fOG
66fXxAHJ0DkdTw7RIsQ0oB4ayTn/dpMqIu3JyF9a7O7pz3BCTA8QAkP7PXcmKH+0
t32XHXSQQaMn1V3GK7Ox2CUbR3ORG2gccP6wWbs2ymmI4hjigEvET86ISyEiSOT9
0mX+x839iQWeesDoCP47y7lYgAtwKXgcHSepWsW5rbwH6RGdeJck5leACyL3aFE0
zYF6RlmJ7NahEbVZOFo6QsuFhZ5yd7HkvU1h14CuaBfYWf/n9jg=
=xwNP
-----END PGP SIGNATURE-----

--3UTJQ9CDOp2Ojq2j--

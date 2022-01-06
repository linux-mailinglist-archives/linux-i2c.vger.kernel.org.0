Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF4F4864A7
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jan 2022 13:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239092AbiAFM5p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jan 2022 07:57:45 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:40034 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239070AbiAFM5o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jan 2022 07:57:44 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7FED6B820D6;
        Thu,  6 Jan 2022 12:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522BAC36AE5;
        Thu,  6 Jan 2022 12:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641473862;
        bh=l/UE+revKaXT7Bb0p/V4j8d5w62p/C4OUBxIoaWlMws=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=puAQWQw2OepEM2ilLggQguUQkjBkI4rshnKO3qDD5JoUIMbGn5yP9tuD8+0Cb95LU
         yJrMKfv4yhza6IiypxKrSvkBaqxQvVXGXcySErTxUK1X/aoYDLgXrBYaod8XieNJuh
         /zP5t6+DUmActNuwVxbhOgLVts+BCwjGfBn00N1iB+GOmCqjBafisvf4xiUGKQIzLt
         I3pZM1M3eTpKLbUpgqZDkiKfuwwUSP0SxLnAuyvpB5SJGyrO5avd0GGKHiF6dTd6F8
         2HkyfN5vej5bsOVzurRXrx1h/naVYZC5mFMvSegeG9c+iUQ7h4aP7Dr044qunNJT8b
         KtQpSbrzg1zyw==
Date:   Thu, 6 Jan 2022 13:57:38 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Miroslav =?utf-8?Q?Bend=C3=ADk?= <miroslav.bendik@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: Wrong piix4_smbus address / slow trackpoint on Thinkpad P14s gen
 2 (AMD)
Message-ID: <YdbnQjxBINyFIRsQ@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Miroslav =?utf-8?Q?Bend=C3=ADk?= <miroslav.bendik@gmail.com>,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org
References: <CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com>
 <f8c13907-d296-baa6-7637-c5f8aa96b7ff@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="o3ME+rrv2v82vae7"
Content-Disposition: inline
In-Reply-To: <f8c13907-d296-baa6-7637-c5f8aa96b7ff@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--o3ME+rrv2v82vae7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi again,

> Address detection does not work because cd6h/cd7h port io can be
> disabled, but it's accessible using mmio. This patch:
> https://lore.kernel.org/all/20210715221828.244536-1-Terry.Bowman@amd.com/
> with modified AMD_PCI_SMBUS_REVISION_MMIO fixed base address
> detection.

Okay, this patch is stalled because Terry is waiting for review
comments. I'll mention the high priority.

> Problem with RMI4 touchpad / trackpoint remains, because rmi4-smbus
> needs host notify feature. I have tried implement this feature,
> without success. Interrupts on IRQ 7 (SMBus) are generated only for
> block data transfers, but not for trackpoint / touchpad move actions.
> I have looked at pinctrl_amd and it looks, that activity is signaled
> using GPIO. This looks promising:

Isn't the interrupt described in the ACPI tables?

All the best,

   Wolfram


--o3ME+rrv2v82vae7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHW50EACgkQFA3kzBSg
KbY8bA//aLJywXLpXOv/idwuijcgWOf3WCGMHER6mxlIhKTJZcnRrjNXMmMOgMMq
G6oj/W0DnDLwrfDUgMatGVBanX/kcI7UZyowZEYNHd1zVTryX3tHiMVYzG6HR02L
tLyYmGNqcuit7+wmNYY34QLI36rrI9XFAT3NnBOIrFQBUVZmyBl4ZatPmv1iqlPk
8kXeptefZ6THLCkXJYhwy7cEms9FMvXOGmcJ97HEDCTxcxWEMSVtknKeqqcAJuPM
ws7JJzhkA0lV3BOn79JECN05AfbVwVuwXfb3yXYP3yOSozQIrzLF8NEEFJ3LA44F
qBYewcFN58Q11xIE2bsBJpuxiQrhxRlD0IzUByi+Fh2LIszkdNIeUlTnVkFXMQOb
wXjymffuGHKY4ysryIg58Se1GN4QfUoFNEhuhX36s7ZN3PSH9tVBcPvz2nBDs7J7
/6HUTDto8xd12x+5MRnwqQOiuFZFZ/q0Ja7ibaT6uG5M7q1y3LYiVEFyWV/2Tu+x
nCxUb0NQCvXf9ZljAu9Vdo4XqgoPwsFTWwMk6AbJGpg2LoBH5xOsBp/5sn0zGzUL
KMPF/3XO1wwa5eQhawyuLUehp6Pz8I9OIuTt5neArScVaXdb5Ce1clM3llqhjPkW
BuMkOSEYp1a8IosLPgmxq6tTp+wOgcoQiapC4IbDEu4fxvj4zYA=
=6Jci
-----END PGP SIGNATURE-----

--o3ME+rrv2v82vae7--

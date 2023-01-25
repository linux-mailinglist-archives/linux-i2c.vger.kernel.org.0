Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A181167ABD8
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jan 2023 09:34:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235224AbjAYIeS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Jan 2023 03:34:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235245AbjAYIeL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Jan 2023 03:34:11 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA913518C7;
        Wed, 25 Jan 2023 00:33:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6709361457;
        Wed, 25 Jan 2023 08:33:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB4DC433D2;
        Wed, 25 Jan 2023 08:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674635631;
        bh=K6brwDn0nPd5gxiWmmiOqjTLHojOPbrwFmK1dTsu3hE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A28QRC1M5D+5Jdx2S8CYqrY8gNGpPR6+atiPKcucumP7QEmgpPOe81r5PctfAMVlQ
         hAUeTNJOQh+mjMEgUQ+iTDfgHPDX0n90ZJUXIqImW9vgdgyNr8qAk1tuUbRfLLzCzH
         6m+t/D4APkPrf8A/tTJAUJvb69oLo+NEFX+nhaFUKiEXaIv9IIUn65XUtbs6jZ0EnR
         qyRvbcvz7GUximGkjlSFFp99RiVBuVhnsasCioqGssCOfpGGgD6Rr3xbty0U+wgjqq
         +zpD5VkrvYEEP5NJY2pM1Mt6h8mmETegSZbZq5/niAF/bPTEuF46R0JjzGtpIJs9Dr
         +ec9Wd72646Ng==
Date:   Wed, 25 Jan 2023 09:33:48 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3] i2c: dev: don't allow user-space to deadlock the
 kernel
Message-ID: <Y9DpbChLZfDONHPz@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230118134940.240102-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tb/30T6pH9Jh5tf8"
Content-Disposition: inline
In-Reply-To: <20230118134940.240102-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tb/30T6pH9Jh5tf8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 18, 2023 at 02:49:40PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> If we open an i2c character device and then unbind the underlying i2c
> adapter (either by unbinding it manually via sysfs or - for a real-life
> example - when unplugging a USB device with an i2c adaper), the kernel
> thread calling i2c_del_adapter() will become blocked waiting for the
> completion that only completes once all references to the character
> device get dropped.
>=20
> In order to fix that, we introduce a couple changes. They need to be
> part of a single commit in order to preserve bisectability. First, drop
> the dev_release completion. That removes the risk of a deadlock but
> we now need to protect the character device structures against NULL
> pointer dereferences. To that end introduce an rw semaphore. It will
> protect the dummy i2c_client structure against dropping the adapter from
> under it. It will be taken for reading by all file_operations callbacks
> and for writing by the notifier's unbind handler. This way we don't
> prohibit the syscalls that don't get in each other's way from running
> concurrently but the adapter will not be unbound before all syscalls
> return.
>=20
> Finally: upon being notified about an unbind event for the i2c adapter,
> we take the lock for writing and set the adapter pointer in the character
> device's structure to NULL. This "numbs down" the device - it still exists
> but is no longer functional. Meanwhile every syscall callback checks that
> pointer after taking the lock but before executing any code that requires
> it. If it's NULL, we return an error to user-space.
>=20
> This way we can safely open an i2c device from user-space, unbind the
> device without triggering a deadlock and any subsequent system-call for
> the file descriptor associated with the removed adapter will gracefully
> fail.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> v1 -> v2:
> - keep the device release callback and use it to free the IDR number
> - rebase on top of v6.2-rc1
>=20
> v2 -> v3:
> - make symbol names more descriptive
> - protect the name_show() sysfs callback too
> - zero the adapter's struct device on device release
> - make sure the code works nicely with CONFIG_DEBUG_KOBJECT_RELEASE enabl=
ed

So, this code handled all my stress-testing well so far. I'll try to
think of some more ideas until this evening, but likely I will apply it
later. Nonetheless, more review eyes are still welcome!


--tb/30T6pH9Jh5tf8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPQ6WgACgkQFA3kzBSg
KbZAZBAAgTfOAe+naUS9bzF8naZ2Re0e60UEDoBPo2YyTozfagfyBfGvjmZdDYgn
g+tdu8jDhhrPjpkkoZiXzBdEq7jVKQL4laDgWTsbN/GqyzRwYwDGdrVr/kwOu4C8
dHkUAaFnTgL50m3e+CiSh+0dGtkZRuLlzA3OMh0TiE/E9g/6NJDkwTOiuQWs8uq3
fmdtBAWgoXK6PjseWSWbkpVsmxUN2AXgZX1NkWwqEGS59BzEyosoMq+COndU8iFS
GE8uYa69WYwkqIne3WwUVxr/wB+yQu2lYS/P/QmBHpvOpEtR1dRWSHptzM1OoaH0
VsoaxXJA8Co7B45UoYn8HuDRXu4adFdipkYniKa8lF0NHckoFZsmwP53hk1XiXk8
1ars7AcrAV5/z+1nMejn9lmeocP/C4THDn3my1j/HNTmQHU0GaI4GSYI44QVrQ24
mU9BjX6dQcCKe1fI5AnIHDwNI2F3ex6coU9F3EYSJw7uuy8mOhR/cqRP0JLJpoOz
692HgRrkARu/TFsSLDONhvr5HwyYoXnCFBzzgxjYkd4EpVQDKwpi0cjAUpVQ/7c2
bFRQRVh67nsRWpWPBCJffYohuzx0XyOekgSqbhr+9pXo60rC2fQ29M/Tftu7+7Wz
GzNe3/Z5wnRh/vEwcHdVgo/LCe2kXXDW6lzYFocWZewnCEYzuds=
=SmGY
-----END PGP SIGNATURE-----

--tb/30T6pH9Jh5tf8--

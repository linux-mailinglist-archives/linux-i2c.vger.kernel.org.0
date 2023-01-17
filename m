Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E649366E76B
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 21:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231508AbjAQUHb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 15:07:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232686AbjAQUFS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 15:05:18 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8406D3A591;
        Tue, 17 Jan 2023 10:57:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F4088614E3;
        Tue, 17 Jan 2023 18:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1216DC433D2;
        Tue, 17 Jan 2023 18:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673981826;
        bh=G9tSeRpjSWF6i+zuXxtGGep/zPeWLfIpxu1vq3NYTSw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kqaA/u2CAenJkPgq8HUh/VteJ2RhY8jAxb6PqZ+OT7C6FASNC8rHWo9d255gjpWtc
         sAJeI620rk8JVh89g4LO5AxBy/kmri/7o3TQ3c6kzhpRFM2VjuQQuEJDgMGV5pjGXc
         90456W+imT2BXbUF9bhEcnXJWlg74mwYrL2FWU4bKAv7b88FF9uX6phzbcHHQCwFIT
         74yWZSdslLpB8l5yb0v7V2UqKlNPDd6YcZpj3aqyqS47fRFbH5Z8wqjCHPdfyiT4Re
         LSRUC1Msgdlr7NQyp7LGW9YqD0mfu4u5HFBo8d6K1NfeVyK0xZ11ehIwk6lWkKroy/
         92/9Az23uADcQ==
Date:   Tue, 17 Jan 2023 19:57:03 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 2/2] i2c: dev: don't allow user-space to deadlock the
 kernel
Message-ID: <Y8bvf9k2K62EscEo@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20221229160045.535778-1-brgl@bgdev.pl>
 <20221229160045.535778-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="X/UsmnCClaapha46"
Content-Disposition: inline
In-Reply-To: <20221229160045.535778-3-brgl@bgdev.pl>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--X/UsmnCClaapha46
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

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

First of all, thank you for tackling this problem. It was long overdue
and I really appreciate that you took the initiative to get it solved.

Here are some review comments already. I'd like to do some more testing.
So far, everything works nicely. Also, I'd like to invite more people to
have a look at this code. We really don't want to have a regression
here, so more eyes are very welcome.


> @@ -1713,25 +1715,7 @@ void i2c_del_adapter(struct i2c_adapter *adap)
> =20
>  	i2c_host_notify_irq_teardown(adap);
> =20
> -	/* wait until all references to the device are gone
> -	 *
> -	 * FIXME: This is old code and should ideally be replaced by an
> -	 * alternative which results in decoupling the lifetime of the struct
> -	 * device from the i2c_adapter, like spi or netdev do. Any solution
> -	 * should be thoroughly tested with DEBUG_KOBJECT_RELEASE enabled!

Have you done this? Debugging with DEBUG_KOBJECT_RELEASE enabled?

> -	 */
> -	init_completion(&adap->dev_released);
>  	device_unregister(&adap->dev);
> -	wait_for_completion(&adap->dev_released);

So, this is basically the key change. I think you handled the userspace
part via i2c-dev well. I don't have proof yet, but my gut feeling
wonders if this is complete. Aren't there maybe sysfs-references as
well. I need to check.

> -
> -	/* free bus id */
> -	mutex_lock(&core_lock);
> -	idr_remove(&i2c_adapter_idr, adap->nr);
> -	mutex_unlock(&core_lock);
> -
> -	/* Clear the device structure in case this adapter is ever going to be
> -	   added again */
> -	memset(&adap->dev, 0, sizeof(adap->dev));

Any reason you didn't add this to release function above? Reading the
introducing commit, the old drivers needings this still exist IMO.
(Yes, they should be converted to use the i2c-mux subsystem, but I don't
think someone will do this)

> @@ -44,8 +45,14 @@ struct i2c_dev {
>  	struct i2c_adapter *adap;
>  	struct device dev;
>  	struct cdev cdev;
> +	struct rw_semaphore sem;

I'd like to name it 'rwsem' so it is always super-clear what it is.

>  };
> =20
> +static inline struct i2c_dev *to_i2c_dev(struct inode *ino)

I'd also prefer a more specific 'inode_to_i2c_dev' function name.
Personally, I'd also name the argument 'inode' but I'll leave that to
you.

> +{
> +	return container_of(ino->i_cdev, struct i2c_dev, cdev);
> +}

=2E..

Doesn't the function 'name_show()' also need protection? It dereferences
i2c_dev->adap.

So much for now,

   Wolfram


--X/UsmnCClaapha46
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPG73sACgkQFA3kzBSg
KbauKA/+P+G7QieucmYlIvLJCy0GYf+XfAxJFptxcRGu8NuWp5l7eYNXHDoVQiL3
kym6GXU+7uMrsppjiGhuBFc9cXE8xtFAyboIXmJjWhlUUOAiOsYpWQA8GdbnnR/W
t7C8AVIW97bj7/R58KBZf43KRlOhMOSe7X6QL771ztSpXL6IQTW7pB0+YMZcdI84
7tWMyl8vH3+e2FRpvygucVcAldnMh4b8jymWbWUJ9SD9fi1kolfdhffyyuRTRM7+
RqsQ7Uvq1thwQDikMQ1RWAsK7PR59HIiCni+esg0Cnkbnc8bdk4Tgk1PMxjKyt7E
2kfhl12h4NxAWXSDVCerRd5wZq6anwNSGLeJmyWKl1bNTyQAyXiLjpGK2WhQmNtR
sM1KKMqvf8bDSYVrpz5cVX2vgBM4FqbQvvKtAm9xVyz1UgU08d4IvSOAKxXdwD/G
1rOoFqch1rL2VdibomcWC/yiEMtgp8XbQB60rmiAA4i9lPqJxOWWY7MpTMYvLVYB
99YQ//ALPbYMizQ/+8yvWOzhHTMdnLEFl980bwUhSpO/KajKKiOBXPWoaKnHOCZ6
xNPIoucLVN969JaId2vThtZyBrFmtA1Gm/WpGt1OBlVKUEWoPMUPJ800ETQm5Izs
eBpwJO7Jq/B3ee7AYCopB88YCjnU458cKtZV1Uot3fjT4FtOW0M=
=c3wR
-----END PGP SIGNATURE-----

--X/UsmnCClaapha46--

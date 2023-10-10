Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6037C04E5
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Oct 2023 21:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234256AbjJJTql (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Oct 2023 15:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234289AbjJJTqk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Oct 2023 15:46:40 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F843B0
        for <linux-i2c@vger.kernel.org>; Tue, 10 Oct 2023 12:46:39 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D7CC433C7;
        Tue, 10 Oct 2023 19:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696967199;
        bh=S7iEsMpSYCQnNiuXan9iozV4uspyFbrB9p7ZHCWzxmM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PlXEICP10q91aPE3wE+2Y4s026Zm6GW2WEHiHRlfTtay5qlmdZFQ+fTPJRXtp+t4A
         uZ3lRL4imzZDpAnm6ghkxV/d7F1xE91gNY6JIGc1Ng5J1/akGeRylnZhgFFEAL50Bh
         MS8SSiXDFEIM7xH2dSI6XwB2H7CJzwgd88IwibpQBC3mdPJpfNfzY3+q1LpEergOdS
         doQckoSY7oFvQRck23f8GRq9Bc2YfIysXJKv79+KN34+M6I1g3XwRzXjLdrQrGnFvm
         uTt6xL4VDChQSwS864tq54lsgiI2v3h5mRzdVHypLQt6BFLowxmr02BCK4UtnCj2Xb
         KBvy7LKg50xRQ==
Date:   Tue, 10 Oct 2023 21:46:35 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH] i2c: i801: Add support for Intel Birch Stream SoC
Message-ID: <ZSWqG04dnl+jpjGP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>
References: <20231002082804.63339-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bkMyAboMMII/IUDk"
Content-Disposition: inline
In-Reply-To: <20231002082804.63339-1-jarkko.nikula@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bkMyAboMMII/IUDk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 02, 2023 at 11:28:04AM +0300, Jarkko Nikula wrote:
> Add SMBus PCI ID on Intel Birch Stream SoC.
>=20
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--bkMyAboMMII/IUDk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUlqhsACgkQFA3kzBSg
KbasEBAAmRKkr0OgUBSwU/2bTbtJNT9cQ23rkfOrUwmaBVEtL3jS1ZE1MQ34VgTN
Cd1kg1fJXiZFiiv0rPcgSno6blZXJIgTd0r44pUNaEVc45QwdIZ6mLFrgOtpZg3R
JB7bKN0hzA3x9DZcXOeQdei9oVPLEBnG/dqWw1GnDuh0JkUneF9SmlI0eXyFgX+C
/rZ6+dW95o3ezbzsEQhfzgrh0ighKfmn2NSj3zJhPdtxBIi2qkHdgLkkvEvLBJzj
0pQ/iBsyqxfUGC0QCJ8Tf5xr8HScZvxHuwEMJzhDXnkvjPdsvF2DTvi53JGRK8Ay
yH4UnFbRk9Z4bGh2ac4kRhzNTuKVsE8RJ8TkwEwbdofZ8ZexChO0usWOSPfALQfx
GOARh2eaOsTTG78604BYMH1cxzDwGpb7QM9TI47HnbPSwUCkmaribQw0ybVAfblK
JnKU6T82V6q3C+jU1/9PJFZhfzMHlZ50xEqnMmNA2i4XucseTt21MmlJy7uycSBt
c+pKP9OtFVx50CQKLWxWFwEtq7rNVQGazqrY4ttHcp21nVb0rwIWnIH91unSgx9O
1ENsJxPc0YeVbwMjHLyGxnyrPW1zb5jhKWmJNtTx7leTStzF2/xPMNFZESJYNoqi
GqSvjBOwWR6acJmsyqNuKQhaKsverqheJ5jqwwsaK9Kuy23I2DA=
=xV3I
-----END PGP SIGNATURE-----

--bkMyAboMMII/IUDk--

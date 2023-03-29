Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1F0C6CF2D4
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Mar 2023 21:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbjC2TNf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Mar 2023 15:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbjC2TNe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Mar 2023 15:13:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECC261FC8;
        Wed, 29 Mar 2023 12:13:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8CC5B61DD6;
        Wed, 29 Mar 2023 19:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C32C433D2;
        Wed, 29 Mar 2023 19:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680117213;
        bh=QLYpAOoTz0vQr0fexdTnCG5E4DHu3UpbMFiYBJ+H8r4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MRtbZdfRzjjO8DzvqMRzbGH+3Qd4m0GccLV4Z5v7x+UIll4CTUIzoCVvOio7QlMJW
         Xgqe/QGhoU9wbXf4V/TAFWj82eglYTkAOSDmwNrL1Oq4O1YkUJCSCAz7YXrRQJ2+eY
         ywd8oe6VhLYBPe4xcqaGvC3WBLCOQ2us3nCXVOmpciFDzN+RiIR7aKFVB/vmZ5w91I
         2N+CGdW6gTS1FtfXfEU72JmArCe7wz69PsZVPsas9d+VZykjwh7PiQjOI4zDFQ+Tqs
         oo3QCIGrov9FcttuzrHjWvyWYSVT8R7J4tLD8Jn3GkQ/UVYqwxsV9Ovv75EaFLYv8g
         fnWeIWwLf+ixw==
Date:   Wed, 29 Mar 2023 21:13:29 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, UNGLinuxDriver@microchip.com
Subject: Re: [PATCH v1 i2c-master] i2c: microchip: pci1xxxx: Update Timing
 registers
Message-ID: <ZCSN2TRm/gvUU0/T@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, UNGLinuxDriver@microchip.com
References: <20230320142237.3091224-1-tharunkumar.pasumarthi@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HdNejqNtJeCuZ5Qv"
Content-Disposition: inline
In-Reply-To: <20230320142237.3091224-1-tharunkumar.pasumarthi@microchip.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HdNejqNtJeCuZ5Qv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2023 at 07:52:37PM +0530, Tharun Kumar P wrote:
> Update I2C timing registers based on latest hardware design.
> This fix does not break functionality of chips with older design and
> existing users will not be affected.
>=20
> Fixes: 361693697249 ("i2c: microchip: pci1xxxx: Add driver for I2C host c=
ontroller in multifunction endpoint of pci1xxxx switch")
> Signed-off-by: Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>

Applied to for-current, thanks!

Please use "i2c: mchp-pci1xxxx: <desc>" for the subject prefix next
time.


--HdNejqNtJeCuZ5Qv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQkjdkACgkQFA3kzBSg
KbaqQQ//SnvFW9MblFKSGMH7OUsq5xDw1eWxPKPfXP4P4+KRJQLrRNgXuKCnZYTj
rPed30mesbqnMBlMqtjWsIrxuVjMIv7y1vOPbJs8+DpgynkBjObBkzFWKQgW8iGx
dyTEvkao7UWvQQeQk3smty0i15S031+YEsoy7vyDO14T2McQXEx5noObgLwkYiPx
KXhyksJ++aetNJsXKM5ZF3yFHrwazZ0V+7D5X+S4X8POlrVtdFl+hUH4Jo0rahhc
uIk30AIypZM5O8ulgxHms2pkicNhk9vLZgVLbrtYynUFQQc0vGy+se1+IB2GrI4+
RCvSSyT4CIJf15SFdGPZF4vv4aXLnNPaj/jS/VfifFLLbz/1wLBh1l9B8PczdIwc
PIutQEGHPLuupw+WjIlWuTeRL7JbQrtmjzk6WE54eC3k3VLyySvmwZaXu6PbtLBf
m2GcGfKgPXU+whaxWD34vSmbfgQASxmIkNvF1kzB6GTGem6BbULGKYx8aL+aSa78
3Xz5QLmZajbX0wJWCKanUdN4RBn90sT7NndxjxCnkuBmtlLsBa5VR5MFw7+vrLBe
bsxnsa7nR4ZacK+O7AXWvhlTMsszcl6KBsB7dc0pKqizbYa+uRse4AIGOg8FFcy2
sU+IUyn0V0nrB2aqzc/F7gX4ft2Lpd/FjD8Whu1s25t6ThMn6h4=
=Yv9N
-----END PGP SIGNATURE-----

--HdNejqNtJeCuZ5Qv--

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB77C52FABD
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 12:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238588AbiEUKyE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 06:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbiEUKyD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 06:54:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 438B847069
        for <linux-i2c@vger.kernel.org>; Sat, 21 May 2022 03:54:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B92E8611C5
        for <linux-i2c@vger.kernel.org>; Sat, 21 May 2022 10:54:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56846C385A5;
        Sat, 21 May 2022 10:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653130441;
        bh=ObUIp14NGHmo+LNVordvQQF3FIZvXiGfM4eYlnXYI7o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZqO+4EVOURJSxMv2+8gB2AZ3iHa6V9ZOMyCppqPXV6ot6ewl8TysZVEZ6F1RUrnaI
         18fsmXGszJPzYrE+am9WDT+MZW4rWEXYBONPYoAMuQGCbPaPMgJF3tFExYSqAAAbHT
         toE0fePHGcF3izMGIt445rCk6sN/6DQ3CZkdswNHCPc8CM21kc2BX8sSdq7SQEpLMA
         ho1lNJh2srzbu3pUZPmoWzqVTMXY4hpoL0lIiCqFbNKqu/EMt5x8un4eeYzX9T+zYr
         C8VX3UwG4O4LdCfHV2GdQHx3SKLZaQYGUFwuvMe8u/WQMO+EZwgaUEnApmxs5c67Qq
         A9FZN3+B8PO+g==
Date:   Sat, 21 May 2022 12:53:57 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: ismt: Provide a DMA buffer for Interrupt Cause
 Logging
Message-ID: <YojExZeax9nCbhty@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org
References: <20220427101910.47438-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5YHI7hIch/yl+8Lk"
Content-Disposition: inline
In-Reply-To: <20220427101910.47438-1-mika.westerberg@linux.intel.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5YHI7hIch/yl+8Lk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2022 at 01:19:10PM +0300, Mika Westerberg wrote:
> Before sending a MSI the hardware writes information pertinent to the
> interrupt cause to a memory location pointed by SMTICL register. This
> memory holds three double words where the least significant bit tells
> whether the interrupt cause of master/target/error is valid. The driver
> does not use this but we need to set it up because otherwise it will
> perform DMA write to the default address (0) and this will cause an
> IOMMU fault such as below:
>=20
>   DMAR: DRHD: handling fault status reg 2
>   DMAR: [DMA Write] Request device [00:12.0] PASID ffffffff fault addr 0
>         [fault reason 05] PTE Write access is not set
>=20
> To prevent this from happening, provide a proper DMA buffer for this
> that then gets mapped by the IOMMU accordingly.
>=20
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

No maintainer response so far, but given this looks like an important
bugfix and you guys are all from Intel as well, I'll apply it this time.

Applied to for-current, thanks!


--5YHI7hIch/yl+8Lk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIxMQACgkQFA3kzBSg
KbbV9g//Wu9n8YwZxJNlPe3lN1LXuFMlwQJ4FVwpBW/LYqiAnnWYHLE0F7sm14cV
QVzLR6e0OU2lMqP5hRfcFZ6ugni6RMRksI69i8vvqJcmlgZh9eOLnFJuaGawJHCi
V08CBbOw8ymrO5yOv2a/WNERy+iUTTV15sc6zCvDdwA10KN03zzsxuAhTY80SFUB
IKRkdoBVce6UA7T4FtlpqnFbdzb7AcgNUxhfoxXlrk+m58Yxc4wy+EZeKx3vfFDg
GCdHwki3lmz3N0mV2dG/J/8AovaENSrvQcjfgnjRXV0cFbDLUIM4RHa1SwXZng79
KxWHRzZiDh7Zgg+Z2LbHkYYhs3e+7TeGL40BufVOMen+q3TYiQwIZHuIJvvXX6zh
JuisowpZmQpL4ctBc/Mjb69zxDd/2W3CAqmKGA2rcLsWP/5pEbYolDwQhW7YHOgJ
LPWb1xiJ+sGuUeROR6sTFo9lbTP9ruUrzx4vFPRlAdQ6A6CLvWE5igDeFV1q3Z/R
xgNWxAg9sWl1Jhf4pPHGA7qA8Vlqevj/NQhiGIVS/crUSy1LLwK9Iyg9upA959yz
vE0QFi7TR9GE7NADCqapHLqp4Ic9ohIgF/7Mkmi7eP9ocnluymBeWePqGH0yzvZ+
i+51RYG/0WXBHKP+yo4OhkS08mjKLdo/BqOcm5fiwPjMlxWV1Uw=
=tn3R
-----END PGP SIGNATURE-----

--5YHI7hIch/yl+8Lk--

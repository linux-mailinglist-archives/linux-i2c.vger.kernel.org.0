Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B7E9528E03
	for <lists+linux-i2c@lfdr.de>; Mon, 16 May 2022 21:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343491AbiEPThw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 May 2022 15:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232405AbiEPThw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 May 2022 15:37:52 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CCE436697;
        Mon, 16 May 2022 12:37:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C421BB81607;
        Mon, 16 May 2022 19:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3799C385AA;
        Mon, 16 May 2022 19:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652729868;
        bh=judWzFax2O3B8ZmwXVnBN/tcmChI0ZNzfAlZ79mvki4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R6iqqgoT6oMpdIkr+HBExWlxd22WJ+m1rkYVDY8QYfshHQiUbVKjlG5wzIN+ns68a
         SuVGYsh8Hf1ZPmhpdYiQIDcMYn9FYjTPCDuArH39K1vGTYqzC/5EZYmTxsiJK5jwZ6
         pKbG6w5KkAKNqNf0rHW76iVQ/WVtMCTL1YhxVGE4DKO/xGnI77PaYf4iu23hXoX5+6
         1DADE2FrbsOw/KPnrrlGUVFGT3TsyQJs5T1YSTzeZrVceUhGmBL8fy5GxCFiH+9Qm4
         jx7aAFadtO8g16P0AWteX3pyxy/cXC2Ne/mEHPQrzgGb67Rn/kPQ4vJ4P8K7aOsR/I
         Z81VOTazNkFqQ==
Date:   Mon, 16 May 2022 21:37:44 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] i2c: gpio: support write-only sda
Message-ID: <YoKoCFU/apFMyUUC@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <3e6c934e-5298-42c5-c346-31b1acaa06ba@gmail.com>
 <a09b4c2e-5256-25b7-59da-f93b04d128c5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kZFe0FArO/s19L5d"
Content-Disposition: inline
In-Reply-To: <a09b4c2e-5256-25b7-59da-f93b04d128c5@gmail.com>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kZFe0FArO/s19L5d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	 * If SCL/SDA both are write-only, then this indicates I2C-like slaves
> +	 * with read-only SCL/SDA. Such slaves don't need open-drain, and partially
> +	 * don't even work with open-drain.

This comment is great!

> + * @sda_is_output_only: I2C-like interface, SDA is write-only.

This one not so much ;)

>   * @scl_is_open_drain: SCL is set up as open drain. Same requirements
>   *	as for sda_is_open_drain apply.
>   * @scl_is_output_only: SCL output drivers cannot be turned off.

I think we whould use a similar description for SDA like we have for
SCL. Maybe we should also repeat here that this setup is for clients
which can only read SDA/SCL?


--kZFe0FArO/s19L5d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKCqAgACgkQFA3kzBSg
KbbImg/+NCObzDNC/bu3mIFG3y9xU/BQfKJuXOpnlRwfC81uduAziVxMyha36dc0
kUNENf/10rhBmtN0/IGYRUA37d1OOkLZVICMgWpn+BdtXPCxyzANdXbzG1HvU/Bg
fKKEGDvoRMkZbwIAC5KlLvp+cTfe5PoO+Zv94CqaNIfyYB+mNzt2sUyaEcY/boJ1
102F1y3owZibnOIcxsFHeg0Smir7QW+1dDtEqxvVe6D0pwQaDg0j4dTy5tNrVcOz
OIMpMsPlEZTjI8wCPTiApxMK2y1+qZkJna1eeXkB9VmOQK6/i6PU12omAB9Ry56y
hdNVkJ3NAsc9N8GRkjJkmcl9AyhJIkHIicr7TRMACxkMRuEGdH6Kb6h3PeN4iCJF
vnbJHKeDXvb/CWoGAs1CmRJ53YFDHg2AiqnxnEjQvns9Zk/73Y3YWEktl3sRe4pR
adJ9p7i/Xd6vMClbd6cBhNzA5NzRoLN9bfNESILnmjc3xOE8fV+IESUc/sazA4sT
5YYHJYD4y++cHo6K09ZEolCR7RseVhbB3sF8ibw/KV1vHU58xVuNQCfP18IsXPd6
+/J2jqyfaCdgEy1WjlhFkozBtCyWbkey8oVxvOAHe238XVWAmksVM14un4scwdxu
igLUQLAOF8iOLSfY4LsPJA6b70/fw4soBrtubpm9SxC/F6SlaZg=
=Tia2
-----END PGP SIGNATURE-----

--kZFe0FArO/s19L5d--

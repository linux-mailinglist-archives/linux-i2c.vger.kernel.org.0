Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2A6672F7F6
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jun 2023 10:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbjFNIgr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jun 2023 04:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243640AbjFNIgq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 04:36:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5C821BD2;
        Wed, 14 Jun 2023 01:36:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 573D6636F2;
        Wed, 14 Jun 2023 08:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194C7C433C0;
        Wed, 14 Jun 2023 08:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686731804;
        bh=YrG8NpuGZ/nxq0KrMZdDhnEPMqdiiB28aFV5bUuMy+c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z01j11hTFPOf+ekDeUsg+i+nIog/9dkMEuhHDsnqAptidzXuj+5v7wdOBZjaMlm6n
         7Fgj24usLj8g8ltxn1slfL+WFj26clPUb5SVREHeXFtI+J7hmbdQ2dutnHjvNBsKxM
         qLV6GQZEsi0mNTLCfv1zBZOYoSKiMxGEbgOMVTRCSm8LMD3xYngaVM6MC5ctTGJ54r
         oNlGzxVVUX3OYg6yT8kQcKqwFqxnSxbGkaAmYLT4fkUbvP1KsrwmHeloejXrbL9kBZ
         cFCaVm09hxtvjK44B9NfIkFN8n/p535VI8GpHetSyU+A67qdTUc+8B7rqOM3rd5WUn
         otoaeX7oazuRw==
Date:   Wed, 14 Jun 2023 10:36:41 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: mpc: Use of_property_read_reg() to parse "reg"
Message-ID: <ZIl8GRyp9cQ57Vbi@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230609183044.1764951-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hnnbRQwrV8j+nDlI"
Content-Disposition: inline
In-Reply-To: <20230609183044.1764951-1-robh@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hnnbRQwrV8j+nDlI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 09, 2023 at 12:30:44PM -0600, Rob Herring wrote:
> Use the recently added of_property_read_reg() helper to get the
> untranslated "reg" address value.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to for-next, thanks!


--hnnbRQwrV8j+nDlI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSJfBkACgkQFA3kzBSg
KbbVsA//Y2pFRd729w5sV2q+7wzHfdvCrW1Ww7stt5rzQKf/biam29VHeN5a06rr
zEmqU3Uku1Iryfu0FRPYLVQa9tzxbfF3fJUh9+1BICaPkQZZOq4tGaOxmw9Rl1Vg
PHoCWmA1B4bpUOiXBxivfvgny5Lub7rnaeiMTP5s9FOoXu1KqapekY55q98AXkqL
SYpgg622+gHhKVZ1Nm4p5QGdaUfrDbSgUgVu7XMtqytHJNdIg7kRYiUfmD1S1wbV
8H1uo1ky5kTbkYxH3JAXhvBFj+CB8m7l3/ir4X0/4akz8XsdvZHbDrG5bmTZXLHh
ZHBM2SviX8yEhv3Baa8Rt1C76t7i4bsHbGPyl/xXTMrlhui2tl7T+vqqy+IoL8M6
fmam+eC5ohd7lWcpAqUkZkt1vK9fquzsEgkBMBSHUU2M89YdPi+MuirMY6rH8Ftw
o61X9/lbhJDL9cdbx65d+ONu26S8MjFDSHZJbM888rl39s7MdKFlpCsG2g8grrMb
OSB/SGHvhJ88FqyNaoGwAlislbjl3jMbEov4uN4fcxKVq9uK1F7/LzppfeVlDYWN
HockiypV1+1/AIlIZ5lEpR1e+j8aUAVC3FI4WFrkI2Xy78oRA3TTDSZwtlqWm8gm
B/qPQO9Oel6vbKQdlIwnfCrp0y/lwpkxHVZpFSdmjGBWwSB1pm0=
=A0mJ
-----END PGP SIGNATURE-----

--hnnbRQwrV8j+nDlI--

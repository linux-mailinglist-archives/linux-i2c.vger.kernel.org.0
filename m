Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54A62424E42
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Oct 2021 09:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240212AbhJGHvH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Oct 2021 03:51:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:53862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232666AbhJGHvG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 7 Oct 2021 03:51:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E3F896105A;
        Thu,  7 Oct 2021 07:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633592953;
        bh=LXx2I+zjqPzCiXmTvt+S9c8lT306evqywnh3A+eKEi4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ceekkvoWEfsdHhLQ5jgdOjyTEIEptJ+Xj1NmbFY6G0cBiP+vC3BrUUVe+CvdazA0f
         S3YxH25fcRV2fyc2qcITaCcIC5MonBzrQkPsr0ewDl5s5UqfHtNDN1Cj7wteCc5Kbd
         e6V3Pl6VlNZx+0EiTsFYQOcCZCGjbhU6OQOu2hgRIgfx2xoGt6d8d2rzBXW1AEFqs0
         zOZKAtgLuAiEK3+pD3BpTFGe/XDh0mVNR0sZ9cFugqbIJ2Q705Nf3SBG5aDnI7aZF3
         38uQ8EABJ72trUh4w1uP+h+crTxLrvi2zeWbVceoNT839FW/8p5cG0LbUgWZ0UBUaM
         2ldetnVNKmdlg==
Date:   Thu, 7 Oct 2021 09:49:10 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     trivial@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: Fix typo s/business/busyness/
Message-ID: <YV6mdpPHn4JJCTn+@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        trivial@kernel.org, linux-i2c@vger.kernel.org
References: <20211007074457.2393322-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UPDISEAvTlByW5cl"
Content-Disposition: inline
In-Reply-To: <20211007074457.2393322-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UPDISEAvTlByW5cl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 07, 2021 at 09:44:57AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> While business is a real word here busyness is meant, so fix accordingly.
> I hope I didn't miss this being a funny play on words :-)

:) No, you didn't miss anything. But I think the comment can just go.
The function name is obvious enough.


--UPDISEAvTlByW5cl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFepnIACgkQFA3kzBSg
KbZW7w/+N1WhD0IvgMob7PaSnJhdyIIwz6tuGHlbB4+xy1drfyaO3TKioMQI8WL5
Ui5kYaX4IFxtywfd4z631YHBrQly16SWpBp9Hl7EFbxoJTrgXZqhTk17dOoGQruX
mpik74ixtt2kd4tb0ew/YKH9jmMBrueP6PSX80baZ3jJubx8tRMcT//XgLgrvA6c
tl43qc5w8uMm7ZldNVQeE6VxDA2tOZAwa+VBrJTZVpdOBEZ23QE3ymN5/X/15R8J
FLEF8Qv5aRZfNGyH3pwGD5TmgPR5KE6TVIOSvxCVCfoLmqtbgeSJF3zp2rK1jPLe
oxUEfU1TMxerXHvKhSnvttGy6kuBW1mNR76KSDxqwWj6Pv9IEQPMwU48hstW8H+b
Sb6v6TL9g3BUGh/kSbW6nWyxQnhDQZBAEU0RnYYZODeru8uH9J/aZPMOceaYSScp
DKuVOCvCMskqBirsoarNeLpuRfIiKPk+UJYS88KhD4V5FNi7RxDEVnP0YVeiHr3j
LLsX4L5FS4hnuLUJtX7oEApMohVt0irteLu4L4S4fck0B4mg+L0uxFiuMPLnkTlo
BuNKNLM5QFHftfsKy+QtYjr0uHYRahI+6cac5RaLM7iglkzUu37fQEuipDXeMMcI
z9RwtTmX1gJKOSZQYZDAPLssioANe/k9MlV94zwmdg29izBFSXw=
=+i5K
-----END PGP SIGNATURE-----

--UPDISEAvTlByW5cl--

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D72B230F63
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 18:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731355AbgG1Qdl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jul 2020 12:33:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:48598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731191AbgG1Qdl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 28 Jul 2020 12:33:41 -0400
Received: from localhost (p54b330d0.dip0.t-ipconnect.de [84.179.48.208])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2E09B2074F;
        Tue, 28 Jul 2020 16:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595954020;
        bh=CyO+KG7FzzjL3u5xcfWSbfuodTo1aFszHfxmh23DayQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s3QrGWs6r41cwRLi3jaM7WnG9VMjZ38NgXikHq81mnPXeHly87gXe1Gdnt+Oa8ILn
         WMcPea7hK8lcMan/78/gjXWYPQk8o5bsU8IP7f3qqXCgtMTZzifwpGkNNbSfGPhFlc
         hXJoX0fJrdTMFqYhxTXf5OLU+QgCqZWvduAImpek=
Date:   Tue, 28 Jul 2020 18:33:37 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com, digetx@gmail.com, sboyd@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [RFC PATCH v5 01/14] i2c: tegra: Don't mark VI I2C as IRQ safe
 runtime PM
Message-ID: <20200728163337.GA3736@ninjato>
References: <1595883452-17343-1-git-send-email-skomatineni@nvidia.com>
 <1595883452-17343-2-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline
In-Reply-To: <1595883452-17343-2-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2020 at 01:57:19PM -0700, Sowjanya Komatineni wrote:
> Tegra VI I2C is part of VE power domain and typically used for
> camera usecases.
>=20
> VE power domain is not always on and is non-IRQ safe. So, IRQ safe
> device cannot be attached to a non-IRQ safe domain as it prevents
> powering off the PM domain and generic power domain driver will warn.
>=20
> Current driver marks all I2C devices as IRQ safe and VI I2C device
> does not require IRQ safe as it will not be used for atomic transfers.
>=20
> This patch has fix to make VI I2C as non-IRQ safe.
>=20
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Applied to for-next, thanks!


--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8gU10ACgkQFA3kzBSg
KbZ3Hw/+JjUetYWJoT3e1Gow35An6YJAiMVml8O8As0dKNoOqQxvKRwPzWLycd/a
+KvB6iWzLLth8Fd74qmC9ksj3aQcI3ABTZJtkFmi9l1xui/AnfzrqwUHrLqxBqo0
URq5URAUQDd0qRkk5t65otVrSSLf9V04KQL53VriUefnvKUk8TMq1GTHG5T7a+Z5
Pk/4mUV5QcdPMv4j5H83ri/0JJZw2EAMRQFKCK7Vr3Mj0/4y3W5DNkJb7u368wZ3
z7KOT6x5vgt3NKwe4x8bPRjeIn6R7BPgaiIrYoO3XDCgN7JBAShVOkCquvhXGR7u
amYZ1YkXtv8hL0eGin4Stc2NFt/WTYz7FP0WtDoJ7Yx/x/ilIA17C7dw7iNBqVY9
Ra05N4oKGROtl5XgdcLIV0skNuVunJ5p2iqci1xIO/Q3gnH6cCRIBOeN1xtNjEIR
wr4pKBBpuU6UlJcfg08r5epbGTEach07HiijY5H5CVkQa0hg5eWWu4KRdFYgvJUb
rWoH96/4oxZZRMORpMUw1bA9AkZFUXTH/6zZ3VTadkznUCYjO8fqzDNYKpwcxUG3
8FbT/x7WL52H+J0ZwRlAxWBU297l0V6JpdO+YHfRp9p2oi9LbUF6nl+kkOZR07zW
76nFW+M44VWlKxeCmgRLtVTHTIUZTRMw4GKalr7c3pwSetzEpo0=
=tHZF
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--

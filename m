Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4764A421826
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Oct 2021 22:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233933AbhJDUHo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Oct 2021 16:07:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:50520 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229945AbhJDUHo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 4 Oct 2021 16:07:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 45B74613C8;
        Mon,  4 Oct 2021 20:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633377955;
        bh=QFxcagdpp3JABtYxQS+YYAu7t5UVcC1yjuRC3LrvJXI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dbWVOAB24Y0eSC8b+FcLrDXVqM6vtntvCA5wsLR/LwFhL2cQ3dqtNKICGzW+vditC
         mhcVO5ayUA2W5SuCybdwi0RqLnRVgRQ9NiHZ5/c+AeD1DEsaAm2X8iJuMXIp5dHn2J
         x4wuHgZhV2V7GJCOg38m0v4e5aixtJTS0aXgy9xMB04I617j4I9Ywr+tLGqTfpZfe6
         GSj8Zfrxx0ewNNuFEhNyI7fA4sLYKSst0RPInEGx8jxDQtpISCEPBncpurj2cDh12F
         4ajiZKB6XjUUj42h/a8n7zj51UxqNqNeIwgFjjrttnFWgjI520h8gdTFm41fJcgAsh
         SxZey5M+dB1YQ==
Date:   Mon, 4 Oct 2021 22:05:51 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Cristian Marussi <cristian.marussi@arm.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 07/14] mailbox: pcc: Use PCC mailbox channel pointer
 instead of standard
Message-ID: <YVten1PrTMxZ3AZw@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Cristian Marussi <cristian.marussi@arm.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20210917133357.1911092-1-sudeep.holla@arm.com>
 <20210917133357.1911092-8-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KJ9CssB/etSZjoeG"
Content-Disposition: inline
In-Reply-To: <20210917133357.1911092-8-sudeep.holla@arm.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KJ9CssB/etSZjoeG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 02:33:50PM +0100, Sudeep Holla wrote:
> Now that we have all the shared memory region information populated in
> the pcc_mbox_chan, let us propagate the pointer to the same as the
> return value to pcc_mbox_request channel.
>=20
> This eliminates the need for the individual users of PCC mailbox to
> parse the PCCT subspace entries and fetch the shmem information. This
> also eliminates the need for PCC mailbox controller to set con_priv to
> PCCT subspace entries. This is required as con_priv is private to the
> controller driver to attach private data associated with the channel and
> not meant to be used by the mailbox client/users.
>=20
> Let us convert all the users of pcc_mbox_{request,free}_channel to use
> new interface.
>=20
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: linux-hwmon@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/acpi/cppc_acpi.c               | 43 ++++++------------
>  drivers/hwmon/xgene-hwmon.c            | 35 ++++++--------
>  drivers/i2c/busses/i2c-xgene-slimpro.c | 33 +++++---------
>  drivers/mailbox/pcc.c                  | 63 ++++++++------------------
>  include/acpi/pcc.h                     | 12 ++---

There is no maintainer for the xgene driver, but I trust you and other
reviewers of this whole series on this. The I2C part is a minor piece
anyhow. So:

Acked-by: Wolfram Sang <wsa@kernel.org>


--KJ9CssB/etSZjoeG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFbXp8ACgkQFA3kzBSg
KbbOFg//SS7XWpERP+NL6rB+Ov7trETKM212tYwLBZ3w8t4C40eqbUKY8c4M66c9
8h9kNtyPatXY+Fv3tvIcYB/gwz8M8zXoWHnU5si/vu8JwJr7eQ9gJabqP/VItwLc
JbGslC3PeUCmvc3iodb09TJYbfM+R5f+bftfi7qG3NQJ9wfCUpRbjDt8k2ecPzQo
dAoVJ/zB0UuNhHgZoBMXL0w/1Or/5KSAsq43m3HUgIVQnm+ShhGHHkbk3NVh8f5v
Cqj1dFLK0ZdG487S51jFZ1AXfmVPLSXrr/IarGNcA0exbYU6JICp6PEl+1vbQuWv
Gv436odC9hAViGmkCOkfJc360xFUXpu0SBVCdLEak75uOUYQFVhZOtiXvklfXdtI
FqS8a3co9Cx9iiXGn/y+Rsrcb6rA/djPz4cVTpv5n1qFgWW9hLB96RpqPd7HMrwx
jPihWQ0vmrldfBk7WsA889ZHhkDkah6vOWof6WMoAC4yH8HPnR+i/F08Fy15q1EO
xS53lQcitE9oqsR3RLMyB93Djx7Oonuo5kP+fwYKC0493I7UjlppR1s2IKVqfahg
bpcu4IJwF66faX3BCHA584vy8B3cioo/hZzmAQzpen2UL7Ykn44z6YZr2oekNpnx
N/zGIEujay68NdYJ63PZNh/OTzWEfZSlMRmYEMFFYpin8k3XQq4=
=4Sde
-----END PGP SIGNATURE-----

--KJ9CssB/etSZjoeG--

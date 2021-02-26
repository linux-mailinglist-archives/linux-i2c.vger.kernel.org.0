Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 472AC32618C
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Feb 2021 11:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbhBZKs7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Feb 2021 05:48:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:54652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229550AbhBZKs5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Feb 2021 05:48:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 190A264EAF;
        Fri, 26 Feb 2021 10:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614336496;
        bh=Esz1NQAGOdP7jefY/y2XPXh2Htwlap/EqjLQH7vn1nk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BF7oVUWkuBHJWTvvQKy4mdaH4N5HrVYlbfmvrsouwZRWEmefSFJbYzNGNX72JjQ/z
         s5YL20UotY75gvNAsyflzGZThDYkIgzeNUplfLKCxAkd4p5Uh7Qv6WrD3Tf9nWafq6
         qSf7sRRdsVZ1WIkqYWH8k3vTAmrjJLUJrJZ6VCNdmzhQnvbYbHGVvFZ00a+Esz/yZ4
         fTcO69TJJ4nzwNoPizcs5LDT7fcb4mPx2ZFwW4nkxK/sbuUcKRRj+BhkiyU8guHHjN
         xMBvXMltQYuStEcwEua/nlpFZxfPo6sxoiqNQY6LPw1u4sGyE1QSCbMn/Uu+l+YM0u
         A2VGejDgCMnpQ==
Date:   Fri, 26 Feb 2021 11:48:12 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     =?utf-8?Q?M=C3=A5rten?= Lindahl <marten.lindahl@axis.com>,
        kernel@axis.com,
        =?utf-8?Q?M=C3=A5rten?= Lindahl <martenli@axis.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: exynos5: Preserve high speed master code
Message-ID: <20210226104812.GG1014@ninjato>
References: <20210216222538.6427-1-marten.lindahl@axis.com>
 <20210226103407.GF1014@ninjato>
 <CAJKOXPcx5a7m0ChqA8BimK=JhnzSgm0cx07RhSu+P8D-2YsfWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="m972NQjnE83KvVa/"
Content-Disposition: inline
In-Reply-To: <CAJKOXPcx5a7m0ChqA8BimK=JhnzSgm0cx07RhSu+P8D-2YsfWw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--m972NQjnE83KvVa/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2021 at 11:40:00AM +0100, Krzysztof Kozlowski wrote:
> On Fri, 26 Feb 2021 at 11:34, Wolfram Sang <wsa@kernel.org> wrote:
> >
> > On Tue, Feb 16, 2021 at 11:25:38PM +0100, M=C3=A5rten Lindahl wrote:
> > > From: M=C3=A5rten Lindahl <martenli@axis.com>
> > >
> > > When the driver starts to send a message with the MASTER_ID field
> > > set (high speed), the whole I2C_ADDR register is overwritten including
> > > MASTER_ID as the SLV_ADDR_MAS field is set.
> > >
> > > This patch preserves already written fields in I2C_ADDR when writing
> > > SLV_ADDR_MAS.
> > >
> > > Signed-off-by: M=C3=A5rten Lindahl <martenli@axis.com>
> >
> > Looks good. Is there a Fixes-tag we could apply?
>=20
> The first commit, 2013 :)
> Fixes: 8a73cd4cfa15 ("i2c: exynos5: add High Speed I2C controller driver")

Thanks! Applied to for-current.


--m972NQjnE83KvVa/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmA40ewACgkQFA3kzBSg
KbZ5/A//dK4Fcf91UDaJiEgIWcUB3p2nnKBUi5bIC0XVA6NYbDVffZPr/ESa3WyB
6ihTfgEdgPy+6zpErE4K/Od7JX94RsSKlo8MmT9WaPk/kfzlWhc10nCZJHFYLuLE
+BqtWour4TTqHcRg/ncjnNicm+etMedSWsgUJ/O3GZEK0SUO+UbQESK4qCLGKH3W
uIuuRUdXASdC4YvUIT4WWWjP8vzeOb/9CAfrQcnz2DTOFqqpp/nFFjifYHFO2Ab4
KbHYYHvJzqZGEpKgf+B7VscQk51oWO9KnzVYeN32z6zuwJxo+i9sKvLXfH1Ebpah
In/IEjVxamd1KZmBzW5gBr/h8IEp5DzEG1aNyvX0itrxr8T69sMxBRQLoDvJI/lW
URGN7tMRypj+FddKvmExyzOwTKzrkl9QVJggf4jF+7ghbKg+HUMN/SZhXHtTrzSI
FQ+1RGuvhqSrBIuKL+XGjtir+qdAu7m6UJk//IWcajWI+V96rSZ4C/F+BXiZ9I7A
G18Zjuh2YGX2oe6V7kAwX/FqlBHPWMUgY82HQurcMJP01HoO3tsyzX9crB1XqVpn
nQ2w8jxrE6cj7PBm3X0HtHg15pd018wzToYOyMoBp7fEOq+WHHiYhvjrQbI7iIMp
3cFQZzSqETfBYT6uag49Knr//csR7gZrEyJEc/Dn0lR4Ws1LxNk=
=S4ZO
-----END PGP SIGNATURE-----

--m972NQjnE83KvVa/--

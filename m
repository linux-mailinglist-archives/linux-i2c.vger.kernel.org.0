Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E52947A70
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2019 09:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbfFQHJk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jun 2019 03:09:40 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46084 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbfFQHJj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jun 2019 03:09:39 -0400
Received: by mail-wr1-f67.google.com with SMTP id n4so8610766wrw.13;
        Mon, 17 Jun 2019 00:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zc43v5OXvBodortEpoBgk30Fo78ZOXUbz9MiDIgCHI8=;
        b=jCFUn1F97HkQbPngeYTE4/eBBPutGYfsqLOd78UIxq9RouKOzpgRpqERNS7Xlxqish
         BM61imiY2+admADx7Sehze8C0yBf9yUt1/vGJ5GZu1v+JaKSqdB+9scJRsOL565VOFEL
         ktNQRBkbwT21Xnd5AUezDBBtavsCV3pCg3ize8/aaT2xy63z20cpWQS6nrrL6uXD+sU1
         BsuXmYCaEsRsEgzmoF1M4mrA7aCLnBH99lcLfKItKSV72GdEyOOrDY1KTe+nVtAZo9m6
         OgotGOmOJJu8LKAsHzrUXoj26SVVjJwL08ZwgWPy8rYNserhJI1eO7O1Egk6MduFTYar
         FwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zc43v5OXvBodortEpoBgk30Fo78ZOXUbz9MiDIgCHI8=;
        b=s+qdUuvI5pD86UUWgpmiSS3pso/yojMljd5q7/hpoSHt3xwoWluueO6fUbw8rIGHUS
         BdLHg8W366rGaLXGnjUVpNO8Aj9W473oUl2iFL9VbBaywZUrBDnn35kRAiYiGvakAsO0
         j+cPTrq4kqVn2rSFZBglkWS6NPYyqh/4RKFEIcQE8sgAu5q3o5bKWOSKQRpL7KKacj4a
         r+LTE/8qgM2Lvvs4nZaCfDWt0zUA+m/PNq1JVMMUSKm1uDW5wZiKSn6+6vlDs4RDCKCw
         Fg7NIrwuh6a6Z2HvTqJVkVrDRkoPXcD8HKbY2BaIE0p05LdEQY3AgVbH3ttrgZBeEugH
         S+BQ==
X-Gm-Message-State: APjAAAXm47koNgmYLUsF6Q+3SDjjBU0nmHsc+GeLTO73jyccgzuxNgqv
        aGcB9Kl6YC7A84cEe0JCM9s=
X-Google-Smtp-Source: APXvYqwY3noebc3h+fhryUhAYjxed8EgOCK3RkQT+brQik4yFxPPgD14tIOlpFTkXC4QUAlFlfRFKA==
X-Received: by 2002:adf:ef8d:: with SMTP id d13mr58425865wro.60.1560755377638;
        Mon, 17 Jun 2019 00:09:37 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id x3sm12563246wrp.78.2019.06.17.00.09.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 00:09:36 -0700 (PDT)
Date:   Mon, 17 Jun 2019 09:09:35 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>, Bitan Biswas <bbiswas@nvidia.com>
Cc:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
Subject: Re: [PATCH V3] i2c: busses: tegra: Add suspend-resume support
Message-ID: <20190617070935.GB30126@ulmo>
References: <1559885867-10190-1-git-send-email-bbiswas@nvidia.com>
 <20190614211129.GG17899@ninjato>
 <758d6dc2-f044-6be3-6896-196ef477d393@nvidia.com>
 <20190615045405.GA1023@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Content-Disposition: inline
In-Reply-To: <20190615045405.GA1023@kunai>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 15, 2019 at 06:54:05AM +0200, Wolfram Sang wrote:
>=20
> > > Without a maintainer ack, this is an exception this time. Should we a=
dd
> > > Dmitry as another maintainer or reviewer at least?
> > >=20
> > I shall followup with Maintainer for ACK in future I2C tegra patches.
>=20
> This comment was not directed at you, sorry if that was not clear. It
> was more for Laxman, Thierry, Jonathan, and Dmitry (if he is
> interested).

I thought I had already acked this. I've certainly been testing this
since I carry it in a local tree. So for what it's worth:

Tested-by: Thierry Reding <treding@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>

Bitan, I don't mind getting the patches to the corporate email address,
but please make sure to also always include the gmail address when
sending patches to the public mailing lists. My workflow is somewhat
quirky that way because I work remotely and for historical reasons.

Thierry

--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0HPK8ACgkQ3SOs138+
s6FohhAAueqXXOLMZn3+hgH+DaEpPrk9LFMEZiSlIPZ7H/nQ7UBUFlw5RL+eMCi8
VdtLa4T3PVlHCWkQB525d+e2Zz59rpsAiLaFpbjnH6rg/1USybHGmXiZonu1q65N
mfia5/uyCp/zOjFI59IUSCWUtDNukWa4Ypy1OIjt/l+kBmPjFALVRNzfdTBDoxli
45IaxfFz0zV/F+1kGSHlcrgPFU14KsFYOdiXsKe2+LS4+dKPmhXf4MALat2f9RRM
QyoniVVfd3a8wMAPuQ7K0KAU4KtnjHglpgxd0WlJ0TN95aTjqi+9cCxIEsshw3T7
FYKWyQqHcZ7j5GPk8UBt9jKHnmsg4z8r2ZMO2+F2+xmMnUvW67vZzFsSNti0KJc7
8IeyHVbhTOQya2fR5pj6pyPDfW7k+kKQ9iQYl98XvaCDrND7k0SdtkB+ctbi/qva
ZqFErPJFPWZggjz2CICICaH98ueKpvKODf/wCDM57ManU7iXO6zx34f4eR758O54
SPvblD8XW6L0RPMq9hnlTmn7mJKw4XhVvGXkABxvwErfKeew+GIcCyJsgz/BsIAZ
SRwKl7WC1FECPHtWQfwN1oWuu33T2eg5Z/nKsJcFQ/mcyk6Kq41Bi0A3NohkJvsp
AkLVEx8ivhD68wLQ/RZQyFcVbiPiUBmxT9OM1BKzZ5utoIsldts=
=e940
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--

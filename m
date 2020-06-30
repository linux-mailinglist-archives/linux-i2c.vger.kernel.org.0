Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 692C120FCFB
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jun 2020 21:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728570AbgF3TtC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Jun 2020 15:49:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:40208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728560AbgF3TtC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Jun 2020 15:49:02 -0400
Received: from localhost (p54b336a9.dip0.t-ipconnect.de [84.179.54.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 79D6120772;
        Tue, 30 Jun 2020 19:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593546541;
        bh=IWxlISulah6RhOy6J2vA8oMb7rvC2fwPEgBQsTsQizI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q5XFm/l9zfm54VE+Z58NhezTyC1ubjIl/uMEXXqS1qb3eBA3LvtgfwX7BBVWCKfkG
         ynklWkwfiHHvG1HcSyGnCEKWWzTVfqj8tfS1OnSZfP/O00HzZYbBNNQTKirWYthLPu
         VtZJLxyG3QdzZ1vaPFBMx6D4zPkwdJkib3K4IcVs=
Date:   Tue, 30 Jun 2020 21:48:58 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: RFC: a failing pm_runtime_get increases the refcnt?
Message-ID: <20200630194858.GC999@ninjato>
References: <20200614090751.GA2878@kunai>
 <CAHp75Vc2RV1daOHMM1zAT2P_YpFzYq=_NVXnagq7qBCS9En04g@mail.gmail.com>
 <CAHp75VdtJN4KbsWgP3G40P4giPGgPE6gdr0CDqOXQjp2wK+i+g@mail.gmail.com>
 <CAMuHMdUadYRNYdJ9JUX90Z1jvtHZmSS4gM+JKft4x-BK2Ry4zQ@mail.gmail.com>
 <CAJZ5v0i87NGcy9+kxubScdPDyByr8ypQWcGgBFn+V-wDd69BHQ@mail.gmail.com>
 <20200614140717.heceqlwq75w5if5s@katana>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="t0UkRYy7tHLRMCai"
Content-Disposition: inline
In-Reply-To: <20200614140717.heceqlwq75w5if5s@katana>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--t0UkRYy7tHLRMCai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> However, that probably means that for most patches I am getting, the
> better fix would be to remove the error checking? (I assume most people
> put the error check in there to be on the "safe side" without having a
> real argument to really do it.)

Kindly asking for more input here: A better answer to all these patches
is to ask if the error checking could not be removed instead?


--t0UkRYy7tHLRMCai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl77lyoACgkQFA3kzBSg
KbbYBQ/4kl7hil6kXJQiXTJJG7bJbwvLI47wU99AL7CPa0o48iaHvxp1BOQXRabH
uCLCDQeV/YzlFkyj/xtDmlEe0O443L/kID51YCXnNAn0dkIrXSOG3fdqfL4UsHIq
B/3Zedoss/BeYjpGm7h0Nyp68OtdMbSn8Z1z7HyRSgaKjVRLiaLfS17GExnwLrHw
chdFpTGxqb8XfxHHWc+T67XJwKx0EbflyDQSlM9PoZDr2RMFGp7z7q5XkkJXY4Ca
8DCLSABYm9NcbguH8Lrim7o8YTqAgOVNOGYZ/Mhi0MPgofQ67nE9StC/anKAplub
8heBmgPbZbCOaTa7uCzyXlAiQfZ2T1rdcdyJqlTDrLv8OOaSul+kIa2l8COrkROW
qxARuW5FpHpndWXm/VfjdZTKxeTYm6QAgr26BFgkxkYfGO/9NJv+Chp1OMRchNx+
w2iBRCa5RzDZK7D+8Y0mq4mEeo+YwZOngvJIY4t90+1yIClj5zIPLTAyPk7VeAb9
51v0h5YZ4WmLwoK2NZBu9y14AJJ75j2D/lfNBekFfCa8FdckgHCRSAhB+HN/OdAH
CN4uEmq3m2xyx+OjgqBkLwPVzaBFplACLnfgW4YucD3orFOvbPl/GjQz36NzrHiQ
KOdmguoTnktGqe3FLMSBpIFqgGY3/D+iHo8ZYNGsBM7R7wP9qQ==
=1R6k
-----END PGP SIGNATURE-----

--t0UkRYy7tHLRMCai--

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F142922DF24
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Jul 2020 14:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgGZMrw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Jul 2020 08:47:52 -0400
Received: from sauhun.de ([88.99.104.3]:53314 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726042AbgGZMrw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 26 Jul 2020 08:47:52 -0400
Received: from localhost (p5486c93f.dip0.t-ipconnect.de [84.134.201.63])
        by pokefinder.org (Postfix) with ESMTPSA id 417252C0610;
        Sun, 26 Jul 2020 14:47:49 +0200 (CEST)
Date:   Sun, 26 Jul 2020 14:47:48 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     swboyd@chromium.org, msavaliy@codeaurora.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: i2c-qcom-geni: Fix DMA transfer race
Message-ID: <20200726124747.GA16169@ninjato>
References: <20200722145948.v2.1.I7efdf6efaa6edadbb690196cd4fbe3392a582c89@changeid>
 <20200723195634.GA908@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline
In-Reply-To: <20200723195634.GA908@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2020 at 09:56:34PM +0200, Wolfram Sang wrote:
> On Wed, Jul 22, 2020 at 03:00:21PM -0700, Douglas Anderson wrote:
> > When I have KASAN enabled on my kernel and I start stressing the
> > touchscreen my system tends to hang.  The touchscreen is one of the
> > only things that does a lot of big i2c transfers and ends up hitting
> > the DMA paths in the geni i2c driver.  It appears that KASAN adds
> > enough delay in my system to tickle a race condition in the DMA setup
> > code.
> >=20
> > When the system hangs, I found that it was running the geni_i2c_irq()
> > over and over again.  It had these:
> >=20
> > m_stat   =3D 0x04000080
> > rx_st    =3D 0x30000011
> > dm_tx_st =3D 0x00000000
> > dm_rx_st =3D 0x00000000
> > dma      =3D 0x00000001
> >=20
> > Notably we're in DMA mode but are getting M_RX_IRQ_EN and
> > M_RX_FIFO_WATERMARK_EN over and over again.
> >=20
> > Putting some traces in geni_i2c_rx_one_msg() showed that when we
> > failed we were getting to the start of geni_i2c_rx_one_msg() but were
> > never executing geni_se_rx_dma_prep().
> >=20
> > I believe that the problem here is that we are starting the geni
> > command before we run geni_se_rx_dma_prep().  If a transfer makes it
> > far enough before we do that then we get into the state I have
> > observed.  Let's change the order, which seems to work fine.
> >=20
> > Although problems were seen on the RX path, code inspection suggests
> > that the TX should be changed too.  Change it as well.
> >=20
> > Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualco=
mm GENI I2C controller")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> > Reviewed-by: Akash Asthana <akashast@codeaurora.org>
>=20
> Applied to for-current, thanks!

Glad we got this sorted. I just wondered that Alok wasn't part of the
discussion. Is he still interested in maintaining the driver? Also
because there is an unprocessed patch left for this driver:

http://patchwork.ozlabs.org/project/linux-i2c/patch/20191103212204.13606-1-=
colin.king@canonical.com/


--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8de3MACgkQFA3kzBSg
KbZfFQ/+IQE8vj6FVFw8UOFQ8gO4XGR5oyKcFYaqngN7SVrbpklAsniO6NCvVdLA
/BrWDRdvmfsUvQdA1BdnVzpG9T6N5hf5K41ijoHhZU9u8QKwtlTJ4iJVQ7LceArW
a/iYn1zdN2B3fkfKyUqJIPgS2qdgTcwupi5prnuYYMD0wXwldb56QGzAkfERk14S
2PNwaSTAJS5OmVzDU4e+4p56V+BG8d4UAz9kI+zGSs9lJ9GggtxN6I8hYJ4/pxv6
scPz8czhh2gcn94tMxumGlLVZqURrAa8RUgKnPCZgD0xiDxZfkRFJpgtQRUmw7My
cHsAts7z/ihNiosL41tNkyP9iCbkKUswRexi96+IjchHX/g/bdkccg37ZweXTSyH
PgRk5Oqc9uD6P471xzLSEowI11kGPhlu06u52kvg77UIGMU8vL0b8NWe2SVaKSPg
L3WvdgVBNWvCQ5kxjc3w0rva0V73427seGAmQSzIFrYH2IOEj5hD36tEQ6beDGJ3
q8g3H8saNMec8oVeHmzMZNsokuVbWhX0fGKkdx8d54d/Z9Q7WFQgD7TbeTaatVgp
XXvUToWCD9XwX7mBYLYoblscVtF8sMExUbO3Y0Jo+hc5tRGw19Jjycwh8zZNID2C
4RwagbzeBFpiP8lQSoVOC+HQAWWwWdFdlaW8eJg2U+Vw1Y6Gv44=
=pw9M
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--

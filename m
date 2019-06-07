Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A6A039896
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jun 2019 00:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730849AbfFGWY7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 18:24:59 -0400
Received: from sauhun.de ([88.99.104.3]:46538 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730799AbfFGWY7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Jun 2019 18:24:59 -0400
Received: from localhost (p5486CE26.dip0.t-ipconnect.de [84.134.206.38])
        by pokefinder.org (Postfix) with ESMTPSA id C34363E474D;
        Sat,  8 Jun 2019 00:24:57 +0200 (CEST)
Date:   Sat, 8 Jun 2019 00:24:57 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Robert Hancock <hancock@sedsystems.ca>
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com
Subject: Re: [PATCH v2] i2c: xiic: Add max_read_len quirk
Message-ID: <20190607222457.GD869@kunai>
References: <1559685351-25249-1-git-send-email-hancock@sedsystems.ca>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Ycz6tD7Th1CMF4v7"
Content-Disposition: inline
In-Reply-To: <1559685351-25249-1-git-send-email-hancock@sedsystems.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Ycz6tD7Th1CMF4v7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 03:55:51PM -0600, Robert Hancock wrote:
> This driver does not support reading more than 255 bytes at once because
> the register for storing the number of bytes to read is only 8 bits. Add
> a max_read_len quirk to enforce this.
>=20
> This was found when using this driver with the SFP driver, which was
> previously reading all 256 bytes in the SFP EEPROM in one transaction.
> This caused a bunch of hard-to-debug errors in the xiic driver since the
> driver/logic was treating the number of bytes to read as zero.
> Rejecting transactions that aren't supported at least allows the problem
> to be diagnosed more easily.
>=20
> Signed-off-by: Robert Hancock <hancock@sedsystems.ca>

Applied to for-current and added a stable-tag, thanks!


--Ycz6tD7Th1CMF4v7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz65DkACgkQFA3kzBSg
KbYcpRAAoNXlZu2POC9Y7fR+gwcbYTt2Fz8XYefnr4ehwLLi77V9YCQ6QgB3Mq4D
8W0O/jzHRnRSVnfjAzoVdfeQdQcHOdxgaPnzOBNRgeVff9KB0ZrLrx8L8zRXhrHO
IVET8TSoK9y6iCGOLs/e6BCA+oHNRAnRKrYWhYk3TwXGtjt/F4f5Utjaa/i/Oak1
0j9NSKTZPImCLymEsa6GuUk0vYfuf+hREUbG4fkPQl3bDFjkauXakehSRx1/rijd
TIFGrwMNWoLWOVcHzA05w1qMwopbJGRn0gcLOc7ZfLHtUJzLLYVsUBrib9Dj9wI6
7wJrb/eeU+mSsJFnLiF1j7EAypiQxhd/UAjNnHhdaowzuDl2jwrXB2lkUmQW4Vcr
MyVE6znjWiyUlDEIiauzrE5LrTNc3cEVbt2sgVO8Un3EOmHJ1+JlvkWcFIjNKKzl
EZFNUxWmmADKnJSD+Jn7DsFKTjowa8nqSd/UKB/+4j7YjncVGH7hNgeGsWm3Dr55
xdE4o6PkzcDApkWKemPrXlpolv1ZN85FDVafWX/BPPr9W+vkB/gKe5pSNEuSEpVE
aB1TNMguaMrUAgFSy86uSpE+9avlarXKTZeI8BG7/rp932X6PGy3FefMGywiLkBF
c6OXINK9O2uuOiBxnZ98O49xcTrAc8vLUnvzZiLdhzEKNhSFWvY=
=GCEI
-----END PGP SIGNATURE-----

--Ycz6tD7Th1CMF4v7--

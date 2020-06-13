Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD7B1F84F3
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jun 2020 21:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgFMTdi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 Jun 2020 15:33:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:51894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726304AbgFMTdi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 13 Jun 2020 15:33:38 -0400
Received: from localhost (p5486c936.dip0.t-ipconnect.de [84.134.201.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C51CD2074D;
        Sat, 13 Jun 2020 19:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592076817;
        bh=sxfke0HVIrZ0Ee3QK78MJ2nbLuoAzvTstF2b/37FDg0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VVCBr7wxEtTNNSHKGtmi/LMJ171KCprJJf2qu54CGTZoL84mlUtDs/MeLURExAnDw
         lGRU17f5R3hgsceWK3QOJiEp5WYQTT3x955bV6OLtX/XKYvZjuV+UohsKdGtVsXlPH
         j08KqMCFV6J6SJof4LALF/tn+klb3HnZ9J1TX2+A=
Date:   Sat, 13 Jun 2020 21:33:33 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-i2c@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH 5/5] i2c: xiic: Only ever transfer single message
Message-ID: <20200613193333.GA6289@kunai>
References: <20200613150751.114595-1-marex@denx.de>
 <20200613150751.114595-5-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline
In-Reply-To: <20200613150751.114595-5-marex@denx.de>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marek,

On Sat, Jun 13, 2020 at 05:07:51PM +0200, Marek Vasut wrote:
> Transferring multiple messages via XIIC suffers from strange interaction
> between the interrupt status/enable register flags. These flags are being
> reused in the hardware to indicate different things for read and write
> transfer, and doing multiple transactions becomes horribly complex. Just
> send a single transaction and reload the controller with another message
> once the transaction is done in the interrupt handler thread.

Do we still get a repeated start between messages of a transfer? Or will
it be a STOP/START combination?

Happy hacking,

   Wolfram


--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7lKgoACgkQFA3kzBSg
KbYUeg/4rqQELHp535SCLVG48KLJSBdCC1S4/H04G3fFWdZ83d3BPjiHNVfOdjtt
COQfuJ7wg7GwRVzz/8Q/PBbjDJJYJPvBbixK04LlRSWhBGr3mt9wMZ7f016rOiHj
1/Y5jeGhOShrnt4CZn5CjqlDTlQIXryFKfT8nKx5c2cQtlW4Kh0tdB2BkGZCKyM9
o2YZXBarsdodWZUCbCLto5cB5DbreoGvI2GDxaMhFZnh7iBKBznxS+OJHznpRDvH
9iNQhbBs0V5nThIBdiLQ6zcHlHGjKTZhBmU47TWiwGhsguBi8hG3Y+8oUsDuJNFK
MNS05dqqzl13x48j531gDyrPwMWnYUMThLsmjQG/6JMb4mIMR+No0tt2HY4OlSA/
2I9PiFHTDCtllHXLaOPCI9arfquPNhJ65Z66TIogq2ippLsHhDHiMBFWn+A+7+gH
8mC8XqsaBNIViqudgmShJZ971VNTyNDLlWvvnu/vXVSUQL1rVnXAv4f5sA5aikL1
0+p8rZvU2uwW52LHYkIqY/Ikq6p4+yex60G4Vbl8rhjIZL/7/QeLpDh0jnJLx6g0
9ZWG0ya8PZ0Z84oXuLGXSlLQAk5Se4Qf4ZZ1+joHqlajumiaz8+DJXAxmG+te7NR
ZfmVko54VA6YxsY2vCcp2ji2nyknOCERtSGvaorkaNQbDxx4mg==
=JFmd
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--

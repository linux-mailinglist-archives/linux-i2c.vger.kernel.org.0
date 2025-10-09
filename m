Return-Path: <linux-i2c+bounces-13427-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE7EBC8570
	for <lists+linux-i2c@lfdr.de>; Thu, 09 Oct 2025 11:39:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA86C19E5E0C
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Oct 2025 09:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C292D4816;
	Thu,  9 Oct 2025 09:39:40 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D13D1862A
	for <linux-i2c@vger.kernel.org>; Thu,  9 Oct 2025 09:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760002780; cv=none; b=SbKW38SgfcLw7jcABs7lsReNoSwHuzSX9v9tuQ5rIZU0Y1q3a/0dN5eCR/aN58l8+cnfkaHCcz7NSjj1axqt0V39chxFrIg3b5KMDPqMl/KWh/zI85Yt5QpHotTKCLOZ81jayHnNAYYqujB+fjzHCvTm0XaLgu2VNQu9T7sC3XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760002780; c=relaxed/simple;
	bh=s+nYVQMblMly/UGa75Z4ptNns7NoRFPfaUaS1XtdQd0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EeN9gLBVKgmUiwvLU19jfKU2Rni3eWuA3PZI9hiN7vGQb1FGoQQfCSmr0AsYKu02Onxbvp2krPwS7BYbBlcyMKw6YzggVh6MMVXqN8AE4BMoAZ9yMsQeamMEeBdMGg0rINj9o70KGgOrevgB+oY1eKYqIwUhXlwVGNW7jAQY+rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v6n7W-0002L4-5c; Thu, 09 Oct 2025 11:39:34 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v6n7V-002i96-1R;
	Thu, 09 Oct 2025 11:39:33 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v6n7V-000000004GG-1ZwE;
	Thu, 09 Oct 2025 11:39:33 +0200
Message-ID: <c863512af9a13eb92bde7e0d383d4b4c81e5ce3e.camel@pengutronix.de>
Subject: Re: [PATCH] i2c: designware-platdrv: handle reset control deassert
 error
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: andi.shyti@kernel.org, andriy.shevchenko@linux.intel.com, 
	jarkko.nikula@linux.intel.com, jsd@semihalf.com, linux-i2c@vger.kernel.org,
 	linux-kernel@vger.kernel.org, mika.westerberg@linux.intel.com
Date: Thu, 09 Oct 2025 11:39:33 +0200
In-Reply-To: <20251009083703.2038187-1-a.shimko.dev@gmail.com>
References: <206e36398db6075bfb0bb0b98295ee7328c5f64f.camel@pengutronix.de>
	 <20251009083703.2038187-1-a.shimko.dev@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

On Do, 2025-10-09 at 11:37 +0300, Artem Shimko wrote:
> Handle the error returned by reset_control_deassert() in the probe
> function to prevent continuing probe when reset deassertion fails.
>=20
> Previously, reset_control_deassert() was called without checking its
> return value, which could lead to probe continuing even when the
> device reset wasn't properly deasserted.
>=20
> The fix checks the return value and returns an error with dev_err_probe()
> if reset deassertion fails, providing better error handling and
> diagnostics.
>=20
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp


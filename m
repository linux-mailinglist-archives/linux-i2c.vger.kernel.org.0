Return-Path: <linux-i2c+bounces-14046-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F126C4C9A7
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 10:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4AE854F55BC
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 09:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9A0B2ECE9B;
	Tue, 11 Nov 2025 09:15:40 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCB7277C86
	for <linux-i2c@vger.kernel.org>; Tue, 11 Nov 2025 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852540; cv=none; b=k2zy8/dDogie4SxMYcW0vyia6WEp6SbzMeVStCS7kWwxSKg1vUkssUU11+t7a0NmNYoeoVed9+quT26g8QzCejT1kSVq9jSfyFMafhV8cBVMQCOVGLSWqg/RQnECCFkEUlP5O7iLGXZCaz4YQ4+P98ZqwdirHDhbGFPj4q80CfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852540; c=relaxed/simple;
	bh=YR0eoIFydfEz+0f3RUaWyHvwfBv/96v6P8ApNu69bHU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rEYv0Rvyp4ORTCE73cUgN7rW8/oew+88wwzMQBgmAEAWQIYzhJvrn6ya9shYhZc9o7MrqTHcRbF42DJ/nyS2ywzE7hWUKJn2Vm8Y0rBtmCis3vb4N2vMXubMP6MGkLo1tnsWKu0KKv+hojp7g2Up7L3Cobyz1eUOeaM3Qf73KuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vIkTB-00079y-Co; Tue, 11 Nov 2025 10:15:21 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vIkTA-008Ass-1m;
	Tue, 11 Nov 2025 10:15:20 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vIkTA-000000002G0-23kI;
	Tue, 11 Nov 2025 10:15:20 +0100
Message-ID: <e3c2096459bdd0c1d48c00a837cc7f8c18044631.camel@pengutronix.de>
Subject: Re: [PATCH RESEND] i2c: designware-platdrv: handle reset control
 deassert error
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Artem Shimko <a.shimko.dev@gmail.com>, Mika Westerberg	
 <mika.westerberg@linux.intel.com>, Andy Shevchenko	
 <andriy.shevchenko@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Andi
 Shyti	 <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 11 Nov 2025 10:15:20 +0100
In-Reply-To: <20251111075400.2982270-1-a.shimko.dev@gmail.com>
References: <20251111075400.2982270-1-a.shimko.dev@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
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

On Di, 2025-11-11 at 10:53 +0300, Artem Shimko wrote:
> Handle the error returned by reset_control_deassert() in the probe
> function to prevent continuing probe when reset deassertion fails.
>=20
> Previously, reset_control_deassert() was called without checking its
> return value, which could lead to probe continuing even when the
> device reset wasn't properly deasserted.
>=20
> The fix checks the return value and returns an error with dev_err_probe()
> if reset deassertion fails, providing better error handling.
>=20
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Looking at the surroundings, this driver could be simplified with
devm_reset_control_get_optional_exclusive_deasserted().

regards
Philipp


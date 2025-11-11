Return-Path: <linux-i2c+bounces-14058-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA978C4E863
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 15:39:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BBA23A62DE
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 14:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7932882B4;
	Tue, 11 Nov 2025 14:33:41 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EBB1C4A24
	for <linux-i2c@vger.kernel.org>; Tue, 11 Nov 2025 14:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762871621; cv=none; b=WyVDCepCQXErAfsKLyYJkW3zG/KF5NpH8det6+tm8ago9/cGkgSpv45GuXGcXHegWdlDbjhbpsgogzZOziMkO+gsOetG4EQSLe5hyaxTo384DYA4WhCXiKuENGQEmkcWyqW4BIlXZlT+E4eiFTnlMsRHr6ub0AG/jwuTT1WjdDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762871621; c=relaxed/simple;
	bh=hF911FpD7hHlzOp+ZGUO10mJQA5px3sr1D8cTSFnPH4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CiwORnzimw+77K4CG1yype1zspo4gj4hJQBManpg83pGRpFPxoM+QHhchYYe++VzDeI/sYeVVhODpHls++Vh2a++BqxqnpKWj/LOYRDp7pawJZwjttSByP28Dww98Ok8IZD9w9QTkFIunE/HJPrHM9uMhP8Ysr34xWZq/2KyBo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vIpR9-0003tQ-9H; Tue, 11 Nov 2025 15:33:35 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vIpR8-008DWM-17;
	Tue, 11 Nov 2025 15:33:34 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vIpR8-000000009SG-19RM;
	Tue, 11 Nov 2025 15:33:34 +0100
Message-ID: <750f15baa9373252a94b9e8a4e703c3494c49481.camel@pengutronix.de>
Subject: Re: [PATCH v3] i2c: designware-platdrv: simplify reset control and
 error handling
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: andi.shyti@kernel.org, andriy.shevchenko@linux.intel.com,
 jsd@semihalf.com, 	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 	mika.westerberg@linux.intel.com
Date: Tue, 11 Nov 2025 15:33:34 +0100
In-Reply-To: <20251111140935.3220840-1-a.shimko.dev@gmail.com>
References: <3c3ece1a00c6e39d865c231e27508bdde0783070.camel@pengutronix.de>
	 <20251111140935.3220840-1-a.shimko.dev@gmail.com>
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

On Di, 2025-11-11 at 17:09 +0300, Artem Shimko wrote:
> The current reset control management uses manual deassertion and assertio=
n
> calls with goto-based error handling, which complicates the code and miss=
es
> the benefits of full device-managed resource handling.

Unnecessary.


[...]
> combined with devm_add_action_or_reset()

No, that's not what I requested in v2.

regards
Philipp


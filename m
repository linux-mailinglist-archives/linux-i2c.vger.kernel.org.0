Return-Path: <linux-i2c+bounces-9487-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81161A3ABB2
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 23:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4681516CC5A
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 22:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A562E2862BC;
	Tue, 18 Feb 2025 22:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vGHASo8E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C401C84AD
	for <linux-i2c@vger.kernel.org>; Tue, 18 Feb 2025 22:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739917879; cv=none; b=cEY9AIKkHEE3+DvEaTiF6TiACcv825Xa7yIqVEvlcOtl2+ZWukNwVVoUoHtpOSm+xXElV0mfLtToxlFKffmiSEAwjuSkm2uERuYgeT+MeMwaTzJ7vwlHo2w2Js4GybcV046ZJpAj7L95g6YV2dLtjCyRr+/qKaY0bYeJI9xrCgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739917879; c=relaxed/simple;
	bh=MzfUm64L5ktf90Ui2yhSW+axsaxN4TaWn7KEL4BCmQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9xGiuVDOc371QdY0QoiJllC9N4tuoNT9qz9EerGi38cl1p1fc99Gm5X0WoRfCq7+aeas6AF+FRakkNMYa2u46P5uwFhUS9nIgobAZqsEwLL8XmBIYqDBVEGwUROG41hkVa9buCvmzVVQu39CP/+qSHatXxLtr9dOyHFM6M0854=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vGHASo8E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326D7C4CEE2;
	Tue, 18 Feb 2025 22:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739917878;
	bh=MzfUm64L5ktf90Ui2yhSW+axsaxN4TaWn7KEL4BCmQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vGHASo8EVIty2JRJQ/XNrirn2QUxJvMb8OYaar9Ew+BHX6yfrAyGmqZZKMn7VzY/X
	 sXS5q7vdPpj1oI758npUJ3aCpv74l5fD6AVEa0Ghk/rjKksHeCsQZK2EcopSUqA2QX
	 CYg6MOmogt2kX4JiNKfbBeUnRAy+LBoOk2jtHjyprfFbBtjuTQWKjU9egd/Z4ieJuF
	 K0PUB+WQPQGC3qruFTXbNipvEb4kLid6psW5ENXzX0bADMlzLaUoRHQp4fSz2WZOIK
	 W1e59pDuRqizMR4mVvT7LDAFcVE0IktdaB7kMSyrvjvq07RrTIHcP4dJ+NxfawiV5m
	 4iZmcwDL0SlRw==
Date: Tue, 18 Feb 2025 23:31:14 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, 
	Sanket.Goswami@amd.com
Subject: Re: [PATCH 1/3] i2c: amd-asf: Modify callbacks of i2c_algorithm to
 align with the latest revision
Message-ID: <wrx7vl2vlo2lxonrgtb6x6j5pwxm6eomok4fn3uhrt6i6gxfpq@6e6atiy2qsps>
References: <20250217090258.398540-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217090258.398540-1-Shyam-sundar.S-k@amd.com>

Hi Shyam,

On Mon, Feb 17, 2025 at 02:32:56PM +0530, Shyam Sundar S K wrote:
> Adjust the i2c_algorithm callbacks to be consistent with the most recent
> revision by updating the callback names from master_xfer, reg_slave, and
> unreg_slave to the current naming convention: xfer, reg_target, and
> unreg_target.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

merged to i2c/i2c-host.

Thanks,
Andi


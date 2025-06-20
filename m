Return-Path: <linux-i2c+bounces-11538-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 369A9AE147D
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jun 2025 09:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB6C0189B88E
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jun 2025 07:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D62226188;
	Fri, 20 Jun 2025 07:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rtWeCbFA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A6F220F23;
	Fri, 20 Jun 2025 07:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750403011; cv=none; b=iwCwMGKNhL+qIkHdQzoQvli+lLOJI1kT+5BD1pxxKvgBurdR9SvEXdYf3xMxoE6cZIh0wimBtKXLrylbiKnNtVClAyTKC/2DqxFQXqjMNrIPcxY3Qm6IKdCJT+VxLIXR02z7Sjk5SswzVEDcw/cU5ZO8oCaxjmU5TvAkMG4cOw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750403011; c=relaxed/simple;
	bh=99Uh/hFshnb6nH2dK4LmyXTBUcV2MIjmpbx0URsMjjI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XzSLCfVr+MC6eihg2OEv1VlBKhCyNcHE1yJq4I3t/PimrWrMmdWZcyDfj+3v3T5soKVRODdIfg0qR1kavVA8+6FrPCNlHxoxL8p5drqPCfSSHHnWxRjp9MOrBSGt62jOXGLBqb4ocQKsBsRgSV59oPtY4Z4pDUkTZ53h9u/GkGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rtWeCbFA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2CF6C4CEE3;
	Fri, 20 Jun 2025 07:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750403011;
	bh=99Uh/hFshnb6nH2dK4LmyXTBUcV2MIjmpbx0URsMjjI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rtWeCbFA6bp5JsVxQ77ExFjDBNw8OqjZeARm4U/2R4P8PDYYvz0DYVGpqvCSrewSZ
	 8Ox9U3peT8PMLMhmue5hWi1dlcvrrR5wb1wrmuFRB6XIPLNfyipCEac599VgOJk8EI
	 kOeXkF/qsVGs8rdVVzcyqWSZSHmWb7EueKrLwXWiHh2Crt0kTyXHVc/+BEYEjfKOXJ
	 dbVHNCvf1eXuGtJKKxdRmjfhFcQrAsi2udJtevq1XRGVL1SjURa4GLXqmo+bYHFilk
	 q06fO8iBt9uPrKTjNixfdmfT70rMn0cTY03IIQt1UsmpucewthY17ci2iJFj4YTwyk
	 eAonOxynP1riQ==
Date: Fri, 20 Jun 2025 09:03:28 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Yu Jiaoliang <yujiaoliang@vivo.com>
cc: Rishi Gupta <gupt21@gmail.com>, Benjamin Tissoires <bentiss@kernel.org>, 
    linux-i2c@vger.kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] HID: mcp-2221: Replace manual comparison with min()
 macro
In-Reply-To: <20250619024741.5807-1-yujiaoliang@vivo.com>
Message-ID: <qoopq849-0p41-787o-3oso-17351o4978qr@xreary.bet>
References: <20250619024741.5807-1-yujiaoliang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Jun 2025, Yu Jiaoliang wrote:

> This improves code readability by using the standard
> kernel macro for minimal value selection while maintaining identical
> functionality.
> 
> Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs



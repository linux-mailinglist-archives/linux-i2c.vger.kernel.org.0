Return-Path: <linux-i2c+bounces-15211-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 319D6D2E629
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 10:00:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 272B9306D286
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 08:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8783B312808;
	Fri, 16 Jan 2026 08:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jo8xwiCH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9632749D5;
	Fri, 16 Jan 2026 08:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768553866; cv=none; b=f3sXP/yuYi89XL0+YTZM4G25rHQVQRUqZwvTr2grl35eY7G9LULy6zA5oO6S9gVFDxP+9HmogzgOrsNbtU5e8L1W2dSvTQuIK5DicEt7meTvPVd7gGGdpY7/c1CjqeBF+uWWe2Sa5wRfej5GHspiCf7ILax4qYpBbYDQg4IkqoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768553866; c=relaxed/simple;
	bh=SU7O53fPWYM/qNmPt62STp0V4+s6nU3fxzQ54kz6G1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7NUz1Vjmt+mQUbV1ppD1BjcvU3Armi4zPDy/YXeE25pj7XzkKURU+XQSz4rxqg9xGoH/JBWDSSCi9kuA7vM9PZn17T9afhLM4QJblBihPkD32GymzHTLmi5FfB8Y7fv+cn7x1GkIu7Pt6wddpUZyK8mbANyHF55seJnn46JpJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jo8xwiCH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50416C116C6;
	Fri, 16 Jan 2026 08:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768553865;
	bh=SU7O53fPWYM/qNmPt62STp0V4+s6nU3fxzQ54kz6G1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jo8xwiCHVDVcfkaaPap6ijvI1/ChdglBkwg+iu80MsuSyz1XTRw0BICO0oTOJWQHw
	 QmXQ6FNfTp/BDXLF8fahwfas26cyFgxvO7E8VT1OLwpSyohwlDpwn48Ftm1vvrTxFb
	 nOD50SFGixOjpNgBBkKctH9UvhQ7c8townTt/TdfHvXZwuvKgZqMwidHpqF7ph2eKn
	 2DyCOHkgOPr9nXG2AHuVoDVM7Jq3guRkMEYZ/jfqebzcuZCpBbuhnryR13AWRQQIfK
	 39yNhcbuh5lMswuPUHUFJh6LbSyaRYpmD+8n0ml98fqPv1Ss3HdbTeubSZbwXUoLnn
	 TkrrnCfzcbGqg==
Date: Fri, 16 Jan 2026 09:57:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/4] drivers: i2c: add the driver for Andes I2C controller
Message-ID: <20260116-spectacular-woodoo-octopus-f7a4b7@quoll>
References: <20260115145244.435890-1-ben717@andestech.com>
 <20260115145244.435890-3-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260115145244.435890-3-ben717@andestech.com>

On Thu, Jan 15, 2026 at 10:52:42PM +0800, Ben Zong-You Xie wrote:
> Add the driver for Andes I2C controller.

Why even subject differs from v1?

Best regards,
Krzysztof



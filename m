Return-Path: <linux-i2c+bounces-5087-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BF69417A0
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jul 2024 18:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A05E91F22C25
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jul 2024 16:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD4718C90A;
	Tue, 30 Jul 2024 16:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hscoFwZO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B31518B46A;
	Tue, 30 Jul 2024 16:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722355845; cv=none; b=BP32s7ZFTnBCIFge1wjz/ewsCiLknoopfmxrOfenLJTO7E0I3f1Ck3HDXNNiuSuPMHSqtna7s+ja/fu+RSiMMHZn7EAhkbeRhaCt6mFKJVnfPPdWgCrFx8pHN8ng21V5/V0fKZjkjA/f7VCVA9IbwpQF3HeEwJjcGC7mkPrwN1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722355845; c=relaxed/simple;
	bh=ruZCOMj4GJJR9diWNZwtPXkWLCbh7l5zwXN9Wrur3to=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8LmS7FnkyqhfqyC5jfYk0LNND9HqJysuy3CfQkquYZOA78dqN1nI6Rujg/1Q/f4VKf6aw3RdFP5IiAEKVwhlQNgajLCpyhCyvjYGY8UNMxm+nec4c8EGhasH8i7H9lDDkt24aYqI3gxaHOYJj5GLnN1WO+yyDcZ3fA4j4ZpfUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hscoFwZO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A9E8C4AF0F;
	Tue, 30 Jul 2024 16:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722355844;
	bh=ruZCOMj4GJJR9diWNZwtPXkWLCbh7l5zwXN9Wrur3to=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hscoFwZOwv5/8Bg9JkyOHYkxUOVRz9xOXGnuptijczkPuXrxJ3KDhGgmoW3Ok99cD
	 mOM0TjXktxqYjpiYsHszIPlzylf764x5Uc8piW+7hFzXvxazi61UgnzmuiquLY0me9
	 5zy3SSqftcye4xK69nsBNrzRoQNdNcPb6OKHKhncZmAAVhL+7FKDM/MchUuuCL7BY4
	 WQiui4vW/5kUsFxzdMQxA37/sRla1cHelMgY8jKTPACT0QEyHzx8zmJan4CwiieJGl
	 hqzHPw+ANKKEZNqe7nF52DT/kqldmhbIvZ6kxl4UcAvwQe1O2WvN5C6PACEHANbMZk
	 LNWArYpWTcp/Q==
Date: Tue, 30 Jul 2024 10:10:43 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Farouk Bouabid <farouk.bouabid@cherry.de>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Peter Rosin <peda@axentia.se>, Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v6 3/8] dt-bindings: hwmon: add support for ti,amc6821
Message-ID: <172235584253.1397741.13902491716086703093.robh@kernel.org>
References: <20240725-dev-mule-i2c-mux-v6-0-f9f6d7b60fb2@cherry.de>
 <20240725-dev-mule-i2c-mux-v6-3-f9f6d7b60fb2@cherry.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-dev-mule-i2c-mux-v6-3-f9f6d7b60fb2@cherry.de>


On Thu, 25 Jul 2024 15:27:49 +0200, Farouk Bouabid wrote:
> Add dt-bindings for amc6821 intelligent temperature monitor and
> pulse-width modulation (PWM) fan controller.
> 
> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
> ---
>  .../devicetree/bindings/hwmon/ti,amc6821.yaml      | 86 ++++++++++++++++++++++
>  .../devicetree/bindings/trivial-devices.yaml       |  2 -
>  2 files changed, 86 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



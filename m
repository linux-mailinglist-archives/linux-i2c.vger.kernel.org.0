Return-Path: <linux-i2c+bounces-7194-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6856398E4C0
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 23:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01EFAB23E13
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 21:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87802216A35;
	Wed,  2 Oct 2024 21:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TsCG8ds3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF5E196C9C;
	Wed,  2 Oct 2024 21:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727903900; cv=none; b=oei/ws2ovEwexQmdUFzSjHOOMOqkBVRXahG69UxqkHw2ukIbkcyvhZPg5BcBzWUAqk8rDR+xqsKcNTVgKpA/1F5QNWXDrHdhYqZvTlT8TOg6hSwmNtIBCrtLOpJ9TZcq/hcG8dVZPPfx/V/d6dgSGt/dt3uGZ0CIOaiFIqc8VWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727903900; c=relaxed/simple;
	bh=oAO0JZ3WapMvfi/mvj+rGbiwrsY2aZ1QIhBav1maoI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZStDnvw0eLuOCHGNgbnefoj9GCKuG9XsUg8VGOTjGONe5RuoxgkOWc1kdY7MHXj3ArzrS9I01dzrdiGgoYRqJVxmhm9NillJ4k16AJRu1qWMS8D8LCwNWQdo0eKMwdYTr61UyXC7mA+1IL6WD3+eXsEz4hgC6JuOpKoRHf5cAGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TsCG8ds3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24545C4CEC2;
	Wed,  2 Oct 2024 21:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727903899;
	bh=oAO0JZ3WapMvfi/mvj+rGbiwrsY2aZ1QIhBav1maoI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TsCG8ds3sPYkC+5uv1+1/Zgvdtr5M4FKnXjz1j1pM0Su1jcwy2LerlvZgDRrLkgSN
	 2XmdiSMa1PbJvZnD1vNFk/Qx3WHNZDzaAqwPxLxytM/8Z/iWTk/EeQyaDQrhmBmn9W
	 J56M1A0j7khLavg5VhQzJhNbbREc84vwTAKIKHvsahFX2atawg4eRTwUWupwA0MKSZ
	 iPJA0gY9w1HuRcbfd7OgS3a6pReF9zLBw0eGLr3gJKKlXxNFD+143QWiFHzIbzstMu
	 5Acc/ZFlrOHzCGPnp/eg5ia+7mMSYJYahPP8FZxsJwTlbK5E5c9yiISEX7JBEBcOZC
	 CYXU/jj33qpkQ==
Date: Wed, 2 Oct 2024 23:18:16 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Michael Wu <Michael.Wu@kneron.us>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, morgan chang <morgan.chang@kneron.us>, 
	"mvp.kutali@gmail.com" <mvp.kutali@gmail.com>
Subject: Re: =?utf-8?B?5Zue5pS2OiBbUEFUQ0ggdjMgMS8yXSBkdC1iaW5kaW5nczog?=
 =?utf-8?Q?i2c=3A_snps=2Cdesignware-i2c?= =?utf-8?Q?=3A?= declare bus
 capacitance and clk freq optimized
Message-ID: <gmrkwvfzeeor6jxca7qudw7udf5qesf4rc3tzcl6bifzip773d@ntrusppi5jqg>
References: <IA1PR14MB622406104B94E02F5C40A3888A702@IA1PR14MB6224.namprd14.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <IA1PR14MB622406104B94E02F5C40A3888A702@IA1PR14MB6224.namprd14.prod.outlook.com>

Hi Michael,

On Wed, Oct 02, 2024 at 09:35:52AM GMT, Michael Wu wrote:
> Michael Wu 希望回收這封郵件 [[PATCH v3 1/2] dt-bindings: i2c: snps,designware-i2c: declare bus capacitance and clk freq optimized]。

if you wanted to send the new series, something went wrong.

Andi


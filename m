Return-Path: <linux-i2c+bounces-2756-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2BC897BF2
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Apr 2024 01:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87889B261F2
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 23:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493F4156966;
	Wed,  3 Apr 2024 23:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MOaFSMW4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F6D29CA;
	Wed,  3 Apr 2024 23:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712186278; cv=none; b=LJFT1ye4Ygr+ccK6Jj1h9jJtOU9eMQxPs2mMIYAYBYpbVk6ro+JccS/ymo3WtK5RXRhTq7UUVXW5QKmGJhiPfWovR3B4DqtwgtTXj3hiGMcTgxTP5Qy3GRyD+UbhKgyDes24dgoBUTGkKym9cXOkpjW0RslHMlPiYrFtvcSVyxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712186278; c=relaxed/simple;
	bh=O/t6VziD60M+YLNqkORIMx20w87PA3QTMrpbzm/5uA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k2VI6old4c9JRo4JceXBEuQCS/NS2DbJP4D41XWKoOwn/mbhvv7GFjLA6dnvOZjTIRufME6EvemVhAWn0M/oxHwn4QKgWJWd34fpQMzbFji9/7WBhZB1KgkL4qgdWwOirMEndHxtKUCiH2kdMnqv5CPOy0QfTpCdfPg3Vvn/k3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOaFSMW4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E72C433C7;
	Wed,  3 Apr 2024 23:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712186277;
	bh=O/t6VziD60M+YLNqkORIMx20w87PA3QTMrpbzm/5uA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MOaFSMW4IxgfrNjtUKvVaTeSA5HOLEZD0JKbVqREYE9+fxlWFb7m4xYTXaHPk4mq+
	 pKhagfJJc+u6rEOPqQF5umcVoEAcdy9b+qKPw8NagdnDpkARzN+fHiKoWsxx0k/cwN
	 wkV1b6k1HXfGlBrdMVkDNoG6lVgKIbi0G6l/ZBMo3N6l3orlxV+s7dvwmKyO2rJuTE
	 04sotEWSuwug7yluiy3inTnIj4SCCrOk+7riqvWrCsak0VL18h+w+Ynp9civJliMdQ
	 UH8mNlvkvYXxYkMOlv1VdbZxahbs8ONiJhruaysKy2VLr3nuTQ/iowiMRCJ2HHusgi
	 /V71e4tgahheg==
Date: Thu, 4 Apr 2024 01:17:51 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
	Russell King <rmk+kernel@arm.linux.org.uk>, Holger Schurig <h.schurig@mn-solutions.de>, 
	Arnd Bergmann <arnd@arndb.de>, Wolfram Sang <wsa@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Heiko Stuebner <heiko@sntech.de>, Yangtao Li <frank.li@vivo.com>, 
	Robert Marko <robert.marko@sartura.hr>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Liao Chang <liaochang1@huawei.com>, 
	Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 04/34] i2c: pxa: hide unused icr_bits[] variable
Message-ID: <6pb32ihr6czs7xxh3wdpzwiplbnr7lomlnlytx4gjfxq4wlb7x@qzb65tcdx4lq>
References: <20240403080702.3509288-1-arnd@kernel.org>
 <20240403080702.3509288-5-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403080702.3509288-5-arnd@kernel.org>

Hi Arnd,

On Wed, Apr 03, 2024 at 10:06:22AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The function using this is hidden in an #ifdef, so the variable
> needs the same one for a clean W=1 build:
> 
> drivers/i2c/busses/i2c-pxa.c:327:26: error: 'icr_bits' defined but not used [-Werror=unused-const-variable=]
> 
> Fixes: d6a7b5f84b5c ("[ARM] 4827/1: fix two warnings in drivers/i2c/busses/i2c-pxa.c")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to i2c/i2c-host-fixes on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[04/34] i2c: pxa: hide unused icr_bits[] variable
        commit: 95197779091166b9ed4b1c630c13600abf94ada7


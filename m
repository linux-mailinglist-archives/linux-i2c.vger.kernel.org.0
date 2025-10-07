Return-Path: <linux-i2c+bounces-13403-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F26B3BC1C23
	for <lists+linux-i2c@lfdr.de>; Tue, 07 Oct 2025 16:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D6BE04F6C88
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Oct 2025 14:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788CE2DFA21;
	Tue,  7 Oct 2025 14:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="neOrGPnv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415B62D73B6
	for <linux-i2c@vger.kernel.org>; Tue,  7 Oct 2025 14:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759847571; cv=none; b=OQAxWvcLf3J1EUZ+WUrG4FPGTSCCui76aO9K1MkmEg7Wqy4l66Ufmcd5Et5yFL1aQx9FJvJxIIeho6uS0c4ScsMrNA1PvrGGzewSjft6M3mNOMEA8OreTU7yFoZa2Nqxxl/jf7zORV6xfR1yAJJkfIQXssXxvXcp2drZiqhMfsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759847571; c=relaxed/simple;
	bh=1oQrLj5yGOQlSIXj7g4XEZvXDlurFg0b32q7u0MLBEI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=H5Hwtc4zjDpnM5VA+FE3h3Zp4eJSP2qaxREdKYLm7wVxPBmjqqu1XcKNmdIsXSGc6knlFj1kqn9MZFaqccTX5Xa8E/5sHqFqQhN/X5k8YLAbG9DoLtSKHjLT9I3m2bSrUA8qzA81tG7xpCPCMtG/sJK58Binya7aj2tfl75wILc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=neOrGPnv; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
DKIM-Signature: a=rsa-sha256; b=neOrGPnvHc9iSxidYSCIyYCXWxkpfy5txs9qsc2H3RdaxO/TtKx5X2cGvf10vWvXjyhpCnbOO0bdH//HK2g7r70dx5VLvEI0RWjHZ5B4vnUceImSmtB4EEs7DkAhJR8QLgfg5N65RA8HKtNNmNeGds5s8CCAx81Y+cw+QmZODwA++o3XTji5g9JY6IhUiktbD/KQRysii1pTsNPUWU+aUeeLi2hNPA7GyuH5SbC+HGcW06WgrjVZ/TCNyNCM5+aTT6iEODdvMSNhBamH27/ZennW1LVau0YgTdx7zil6/bLdrHS0vQSi50uWG3DB/CYUUiK9CXKVYoZD1mxL6XsFDA==; s=purelymail3; d=purelymail.com; v=1; bh=1oQrLj5yGOQlSIXj7g4XEZvXDlurFg0b32q7u0MLBEI=; h=Feedback-ID:Received:Received:From:To:Subject:Date;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-i2c@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1559417095;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 07 Oct 2025 14:32:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peter@korsgaard.com>)
	id 1v68js-004NF6-0I;
	Tue, 07 Oct 2025 16:32:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Andrew Lunn <andrew@lunn.ch>,  Andi Shyti <andi.shyti@kernel.org>,
  linux-i2c@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux@ew.tq-group.com
Subject: Re: [PATCH 2/2] i2c: ocores: respect adapter timeout in IRQ mode
References: <1eb320b6b7d3a12e62785893ea68c4d16aa2560d.1759838476.git.matthias.schiffer@ew.tq-group.com>
	<9be9d4bef9fd6d0b66534a3731b4bc6b86cc79ab.1759838476.git.matthias.schiffer@ew.tq-group.com>
Date: Tue, 07 Oct 2025 16:32:28 +0200
In-Reply-To: <9be9d4bef9fd6d0b66534a3731b4bc6b86cc79ab.1759838476.git.matthias.schiffer@ew.tq-group.com>
	(Matthias Schiffer's message of "Tue, 7 Oct 2025 14:09:25 +0200")
Message-ID: <87h5wa235v.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

>>>>> "Matthias" == Matthias Schiffer <matthias.schiffer@ew.tq-group.com> writes:

 > While the timeout field of the i2c_adapter defaults to 1s, it can be
 > changed, for example using the I2C_TIMEOUT ioctl. Change the ocores
 > driver to use this timeout instead of hardcoding 1s, also making it
 > consistent with polling mode.

 > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

Acked-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard


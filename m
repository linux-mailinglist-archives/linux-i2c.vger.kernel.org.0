Return-Path: <linux-i2c+bounces-1626-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 215DD848ACC
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Feb 2024 04:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFC011F2365B
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Feb 2024 03:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6187524F;
	Sun,  4 Feb 2024 03:21:23 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55861C11
	for <linux-i2c@vger.kernel.org>; Sun,  4 Feb 2024 03:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707016883; cv=none; b=e/UlGG2iqoutM8xOav0OQ7PI7W5CU1Dzf8HFaSR2409XIi+CGvydmabE9G98rcE+TDWCdZMm32ozar5UzUpb7HCKaaiRtskjg79nWqsW0EfTSPypySaQBzI9J3SQKvRJvT96fEUEztMiGt9XllR4cHw0NweXwO5QXLaEzYBkH0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707016883; c=relaxed/simple;
	bh=JFW+CV7Oms5zVN/na9vnrU9q/cfFyjYzSbETsL75iaM=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=BfUNk/pIutwRcIReL5ZXu3BWAP9k2cdTbeOLygEwwdhPOKlZf+tpVeDVOfjMITAaMWszeJUbaNZtmg2rR9crEvZ6DAu3qqH44udqX4WV82FvYFrwDypVrgJdAoJAVs7Wi/ICgASmigZ0gPyDYfPE2ZVtmF3wWnA+BS7z2rk6m/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com; spf=pass smtp.mailfrom=trustnetic.com; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trustnetic.com
X-QQ-mid:Yeas43t1707016808t528t63656
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [115.192.112.184])
X-QQ-SSF:00400000000000F0FTF000000000000
From: =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 2474470815979315366
To: "'Jarkko Nikula'" <jarkko.nikula@linux.intel.com>,
	<linux-i2c@vger.kernel.org>
Cc: "'Andi Shyti'" <andi.shyti@kernel.org>,
	"'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>,
	"'Mika Westerberg'" <mika.westerberg@linux.intel.com>,
	"'Jan Dabros'" <jsd@semihalf.com>,
	"'Sanket Goswami'" <Sanket.Goswami@amd.com>,
	"'Basavaraj Natikar'" <Basavaraj.Natikar@amd.com>,
	<Ruhl@web.codeaurora.org>, "'Michael J'" <michael.j.ruhl@intel.com>
References: <20240131141653.2689260-1-jarkko.nikula@linux.intel.com>
In-Reply-To: <20240131141653.2689260-1-jarkko.nikula@linux.intel.com>
Subject: RE: [PATCH 0/6] i2c: designware: Generic polling mode code
Date: Sun, 4 Feb 2024 11:20:07 +0800
Message-ID: <062201da5719$0dccb790$296626b0$@trustnetic.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQK3d/KT1/kAk9pcvlSDB8MmIRBn+q865pJw
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz8a-1

On Wed, Jan 31, 2024 10:17 PM, Jarkko Nikula wrote:
> Hi Jiawen, Sanket and Basavaraj
> 
> Could you test on your Wangxun 10Gb NIC and AMD NAVI GPU harware this
> patchset since it's touching both.
> 
> For the AMD NAVI GPU and changes are less but for the Wangxun 10Gb NIC
> patchset replaces the txgbe_i2c_dw_xfer_quirk() with generic polling mode
> code.
> 
> I've been testing this on our HW which all have interrupt connected and
> tried to cover also FIFO depth defines for Wangxun 10Gb NIC. Obviously I
> would like to know how this set works on your real HW.

Hi Jarkko,

Sorry for the late reply.
I've been testing the patch series on Wangxun 10Gb NIC, it works well.
Thanks!



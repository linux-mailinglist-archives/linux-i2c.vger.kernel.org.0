Return-Path: <linux-i2c+bounces-5782-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C7395E69B
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 04:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 452D8B20DF4
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 02:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F03865228;
	Mon, 26 Aug 2024 02:05:30 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CDBE567;
	Mon, 26 Aug 2024 02:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724637930; cv=none; b=tVxdVbKXl5cLjtzitX1okvMiBHvdRZbD3/mFXZZTJzFSVT0Jhz94pTGkZLO9S1eacTJ0PlbpmBLoctmvpypaFjd2lx0Aw5oCYassvrt+SheWsYwBT8lvI9KftF5Xet6+vil7EuNNr463uAJlODhUFhHq/87cXxjMiURolwwbU/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724637930; c=relaxed/simple;
	bh=kYu3wz3lQpH1r7r2ZaBtYQon85TelmNrznPyRrI3ulA=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=MzF0AbyoHd0GACkSnD8dhy/J6k5bvrBjsK5el5c8oqtDrmOVs3oJtuCswaGgozkQFCLdEGVYdPwLpGZX4BUTvgHmFRLhxH3Jc+oNhUTHst7eXTKcDwaRKQ0UzobnkDYGM4/xxMYQNGITvRZO4r5iI60ZK+ulmyQIAzhKbRtNLfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com; spf=pass smtp.mailfrom=trustnetic.com; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trustnetic.com
X-QQ-mid:Yeas3t1724637883t508t17710
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [125.118.254.234])
X-QQ-SSF:00400000000000F0FVF000000000000
From: =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 9879480277147797914
To: "'Andrew Lunn'" <andrew@lunn.ch>
Cc: <andi.shyti@kernel.org>,
	<jarkko.nikula@linux.intel.com>,
	<andriy.shevchenko@linux.intel.com>,
	<mika.westerberg@linux.intel.com>,
	<jsd@semihalf.com>,
	<davem@davemloft.net>,
	<edumazet@google.com>,
	<kuba@kernel.org>,
	<pabeni@redhat.com>,
	<rmk+kernel@armlinux.org.uk>,
	<piotr.raczynski@intel.com>,
	<linux-i2c@vger.kernel.org>,
	<netdev@vger.kernel.org>,
	<mengyuanlou@net-swift.com>,
	<duanqiangwen@net-swift.com>
References: <20240823030242.3083528-1-jiawenwu@trustnetic.com> <888f78a9-dea9-4f66-a4d0-00a57039733d@lunn.ch>
In-Reply-To: <888f78a9-dea9-4f66-a4d0-00a57039733d@lunn.ch>
Subject: RE: [PATCH net 0/3] Add I2C bus lock for Wangxun
Date: Mon, 26 Aug 2024 10:04:42 +0800
Message-ID: <01d701daf75c$50db4450$f291ccf0$@trustnetic.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQH8I/V4PrHZ+O/IFu6cfIurHK/3+gGW9YkssemzGpA=
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz8a-1

On Mon, Aug 26, 2024 9:33 AM, Andrew Lunn wrote:
> On Fri, Aug 23, 2024 at 11:02:39AM +0800, Jiawen Wu wrote:
> > Sometimes the driver can not get the SFP information because the I2C bus
> > is accessed by the firmware at the same time.
> 
> Please could you explain this some more. What firmware?

It's the firmware of our ethernet devices.

> There some registers which are clear on read. They don't work when you
> have multiple entities reading them.

I'm not trying to multiple access the I2C registers, but these registers cannot
be accessed by other interfaces in the process of reading complete information
each time. So there is a semaphore needed that locks up the entire read process.



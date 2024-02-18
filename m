Return-Path: <linux-i2c+bounces-1851-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCD68595ED
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Feb 2024 10:20:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79BE21C20EAE
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Feb 2024 09:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47C5911CBA;
	Sun, 18 Feb 2024 09:20:41 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.58.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7210211196
	for <linux-i2c@vger.kernel.org>; Sun, 18 Feb 2024 09:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.58.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708248041; cv=none; b=ZDuDojAdO+J+9E9co5ioiuBsK5p2rUzOjvD9ouKCTQvOAln9yaBfZRYJNgydbm868Hh9CXT5cnU2H6CMELv9mzAzNbbNqCu0P77qIhXa4Yv2fJqjami2awW9TIJltPeLs1aVcdbkNFZUFd2HmT1pehNX9fc7sT8zi7rXffryLY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708248041; c=relaxed/simple;
	bh=DgPNwzzQuoFHe2Y5tX+SUNnXJk95BHHmySZ6oqafB+E=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=hz1Cw/ZyS9WFUgYg7GQDrET9GieMj2mnopdJlzmN/W5DQtBsJ1T12vqLwpeRSsqivnQ3SWK1iksgHbNyTUiNlql2mR9D/scXw6CQy5YP+yUaiS33wztWE3u6QuNFN3GrDxyMFS0T/Z46QnOYpkammkdudn6r1DFKx3n4EXB87+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com; spf=pass smtp.mailfrom=trustnetic.com; arc=none smtp.client-ip=114.132.58.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trustnetic.com
X-QQ-mid:Yeas53t1708247954t177t08839
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [122.235.246.158])
X-QQ-SSF:00400000000000F0FTF000000000000
From: =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 16135054984999250213
To: "'Jarkko Nikula'" <jarkko.nikula@linux.intel.com>,
	<linux-i2c@vger.kernel.org>
Cc: "'Andi Shyti'" <andi.shyti@kernel.org>,
	"'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>,
	"'Mika Westerberg'" <mika.westerberg@linux.intel.com>,
	"'Jan Dabros'" <jsd@semihalf.com>,
	"'Sanket Goswami'" <Sanket.Goswami@amd.com>,
	"'Basavaraj Natikar'" <Basavaraj.Natikar@amd.com>,
	<michael.j.ruhl@intel.com>
References: <20240213124847.672084-1-jarkko.nikula@linux.intel.com>
In-Reply-To: <20240213124847.672084-1-jarkko.nikula@linux.intel.com>
Subject: RE: [PATCH v3 0/6] i2c: designware: Generic polling mode code
Date: Sun, 18 Feb 2024 17:19:13 +0800
Message-ID: <003901da624b$89c7c190$9d5744b0$@trustnetic.com>
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
Thread-Index: AQKAWE6xFupILVV4nfObJxnfcYlh7K/D5Ysw
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz8a-1

On Tue, Feb 13, 2024 8:49 PM, Jarkko Nikula wrote:
> Hi Jiawen, Sanket and Basavaraj
> 
> I hope you could give a quick test to this patchset to see it won't cause
> regression on your HW. This is mostly the same than the first version what
> Jiawen tested earlier but in this 3rd version I decided to drop semphore
> touching code patches from v2 due they being out of scope and fix a few
> things noted by Andy.
> 
> Changes are in the patch 3/6 with two minor fixes to comments while moving
> them and the patch 6/6 where i2c_dw_wait_transfer() is slightly modified
> by Andy's suggestion plus I decided to remove one comment which became
> unclear after this patch.

Hi Jarkko,

I've been testing the v3 patch series on Wangxun 10Gb NIC, it works well, too.
Thanks!

Tested-by: Jiawen Wu <jiawenwu@trustnetic.com>



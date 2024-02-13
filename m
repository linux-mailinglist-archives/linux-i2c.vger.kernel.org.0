Return-Path: <linux-i2c+bounces-1694-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F20A8530DD
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 13:49:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B1A4281D28
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 12:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C820740BFE;
	Tue, 13 Feb 2024 12:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRWfjWIC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB023FE47
	for <linux-i2c@vger.kernel.org>; Tue, 13 Feb 2024 12:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707828535; cv=none; b=Zh9s1nR3lyECw2CXu8sm2VfaGJQcKXnJNyIAjEk6BZOBfwE2n2zweOUHHf+aUup1HBrNbxKbqS2v2U7tg0IoXqj/FLXhYqEHoOKPukQ1Ex4NFtjGZg9wFwKbPGxteP+T2iI/HvV2p+DG74DLX/Au7TX9YhFcON96ze/lo/wEuJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707828535; c=relaxed/simple;
	bh=jl92DyfZ+8gdV0VZbO0IguZShTH6jUipX+sBVgOz2E0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KNIPHD9ivJnmyW4OpnPEBgzDe+vJmilunkYa5DWq/6qlgTxfM+1sETGaTRGfFgflqZ6a9n/X/hCYZwM4dlE+5Zuob0dspSbQVztfYPY77VdYOUaeIlntxzGnCsv78C8ZgicRQTIOusJNGRyKjHz1+QhAzzn6WSK/KZVSFdwZ3tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRWfjWIC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707828534; x=1739364534;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jl92DyfZ+8gdV0VZbO0IguZShTH6jUipX+sBVgOz2E0=;
  b=hRWfjWICS0Le+segLGZFUa1KmYH6S79jnhJ2qiC1BWTM8tVkwpnAX/wH
   a/j9eLM38g5m6fhE1+RQNEio8Ibah5VEDTheETgfHqAHWRDtLCnAZjp29
   OwNv/lWsQP4eFC3RbOZrcWIVn1NZrPltNXONT+JhxGQnFI2ySLl9IPxoD
   WegW2OleFDZQ1qdGOWYST8rDqRRjUBlzKgDvEgnFr6VVuFZ5GC8Q2S3U+
   9gDwcBaPx/jfr7v48E4J+gN/nsmfkyaopF5/NT5W5qCvLKiDcovRIrdQ4
   ILY7zkTvN6axE7r0AL3XvL0aTHCIIzOYooH6I7PT0s9RsFkiUOtqmC+UK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12467221"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="12467221"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 04:48:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="7486611"
Received: from marquiz-s-2.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.58])
  by fmviesa004.fm.intel.com with ESMTP; 13 Feb 2024 04:48:50 -0800
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Sanket Goswami <Sanket.Goswami@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	michael.j.ruhl@intel.com,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v3 0/6] i2c: designware: Generic polling mode code
Date: Tue, 13 Feb 2024 14:48:41 +0200
Message-ID: <20240213124847.672084-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jiawen, Sanket and Basavaraj

I hope you could give a quick test to this patchset to see it won't cause
regression on your HW. This is mostly the same than the first version what
Jiawen tested earlier but in this 3rd version I decided to drop semphore
touching code patches from v2 due they being out of scope and fix a few
things noted by Andy.

Changes are in the patch 3/6 with two minor fixes to comments while moving
them and the patch 6/6 where i2c_dw_wait_transfer() is slightly modified
by Andy's suggestion plus I decided to remove one comment which became
unclear after this patch.

v2:
https://lore.kernel.org/linux-i2c/20240206145158.227254-1-jarkko.nikula@linux.intel.com/

v1:
https://lore.kernel.org/linux-i2c/20240131141653.2689260-1-jarkko.nikula@linux.intel.com/

Jarkko Nikula (6):
  i2c: designware: Uniform initialization flow for polling mode
  i2c: designware: Do not enable interrupts shortly in polling mode
  i2c: designware: Use accessors to DW_IC_INTR_MASK register
  i2c: designware: Move interrupt handling functions before
    i2c_dw_xfer()
  i2c: designware: Fix RX FIFO depth define on Wangxun 10Gb NIC
  i2c: designware: Implement generic polling mode code for Wangxun 10Gb
    NIC

 drivers/i2c/busses/i2c-designware-common.c  |   2 +-
 drivers/i2c/busses/i2c-designware-core.h    |  23 +-
 drivers/i2c/busses/i2c-designware-master.c  | 419 +++++++++-----------
 drivers/i2c/busses/i2c-designware-pcidrv.c  |   2 +-
 drivers/i2c/busses/i2c-designware-platdrv.c |   2 +-
 5 files changed, 208 insertions(+), 240 deletions(-)

-- 
2.43.0



Return-Path: <linux-i2c+bounces-13471-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D889BD72EF
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 05:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1720A3B98C6
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 03:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3292C2372;
	Tue, 14 Oct 2025 03:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="E5Mmvgs/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F48223DD5;
	Tue, 14 Oct 2025 03:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760412349; cv=none; b=TT7y8uU3C3GFOhTx+94SSDOu7v7RWuJtz+xPrXdTjT1tBRpHc6N7FJQvZJ5R+sjwogT6NT9EiAom/biJGBZHQaAD9Jhp3r8z2zvClw4Nn2HAoZFTAqUEfVC0AgQEnPlOBtLrL0l/SqOEKFoKxhFWH+54MdvmwXzbq8gwBy6daOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760412349; c=relaxed/simple;
	bh=WP0V2CJdocYRaivc4bHLr/xoIwglU9FsejPno8121SU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=f5PsQfqWlqlN5G6FA3Gux8uDrdG2zxwVfBL4ErGfleu8t6OTXjfn9K5cpvBsJEnkpvM9txlx8r38og8tKk28xTDx0+PiDP5XVPWHwlx2m00CE2OVYV0MD6hqhWtLe5hsPnIwUPIRyYtYbls9SAVO0+QSaOc49AYHqgU8oAgOOeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=E5Mmvgs/; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Z313mOEb31FdOTNjEzdrnA3V6QYJWAM6t16ixtdKUYQ=;
	b=E5Mmvgs/WFzwkG4l4+a5/EsnwOweW9D9xKYzLnoLsbC8qQ/aOeQZqF7551V8c+QQwEeDLAme8
	Xv/DVHBnjSozUaLItjK54MtRGArGAaL7kMFlJEhO0NW3BX/AfHn8Q8C79yA6rhJN55Rr+uW8F59
	b4ggsrpa2r0kZCFZSwCZpjk=
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4cm02c6Hxrz12LKQ;
	Tue, 14 Oct 2025 11:24:56 +0800 (CST)
Received: from dggpemf500016.china.huawei.com (unknown [7.185.36.197])
	by mail.maildlp.com (Postfix) with ESMTPS id B1A37140158;
	Tue, 14 Oct 2025 11:25:42 +0800 (CST)
Received: from [10.174.177.19] (10.174.177.19) by
 dggpemf500016.china.huawei.com (7.185.36.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 14 Oct 2025 11:25:41 +0800
Message-ID: <3b69c4b6-2cbb-4cc3-8bc7-cccb96ad6d8e@huawei.com>
Date: Tue, 14 Oct 2025 11:25:40 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: dev: Fix field-spanning write in
 __do_trace_smbus_write()
To: <wsa+renesas@sang-engineering.com>, <dhowells@redhat.com>,
	<rostedt@goodmis.org>
CC: <yuehaibing@huawei.com>, <zhangchangzhong@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
References: <20250918113956.169348-1-wangliang74@huawei.com>
From: Wang Liang <wangliang74@huawei.com>
In-Reply-To: <20250918113956.169348-1-wangliang74@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500016.china.huawei.com (7.185.36.197)


在 2025/9/18 19:39, Wang Liang 写道:
> A field-spanning write warning was observed with following output:
>
>    ------------[ cut here ]------------
>    memcpy: detected field-spanning write (size 86) of single field "entry->buf" at ./include/trace/events/smbus.h:60 (size 34)
>    WARNING: CPU: 1 PID: 2646 at ./include/trace/events/smbus.h:60
>    CPU: 1 UID: 0 PID: 2646 Comm: syz.0.310 Not tainted 6.17.0-rc5+ #5 PREEMPT(none)
>    RIP: 0010:do_trace_event_raw_event_smbus_write.constprop.0+0x37a/0x520 include/trace/events/smbus.h:23
>    Call Trace:
>     <TASK>
>     __do_trace_smbus_write include/trace/events/smbus.h:23 [inline]
>     trace_smbus_write include/trace/events/smbus.h:23 [inline]
>     __i2c_smbus_xfer.part.0+0x5ce/0x9a0 drivers/i2c/i2c-core-smbus.c:572
>     __i2c_smbus_xfer+0xa3/0x1a0 drivers/i2c/i2c-core-smbus.c:566
>     i2c_smbus_xfer drivers/i2c/i2c-core-smbus.c:546 [inline]
>     i2c_smbus_xfer+0x208/0x3c0 drivers/i2c/i2c-core-smbus.c:536
>     i2cdev_ioctl_smbus+0x2cd/0x850 drivers/i2c/i2c-dev.c:389
>     i2cdev_ioctl+0x3bb/0x800 drivers/i2c/i2c-dev.c:478
>     vfs_ioctl fs/ioctl.c:51 [inline]
>     __do_sys_ioctl fs/ioctl.c:598 [inline]
>     __se_sys_ioctl fs/ioctl.c:584 [inline]
>     __x64_sys_ioctl+0x191/0x210 fs/ioctl.c:584
>     do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>     do_syscall_64+0x5d/0x2d0 arch/x86/entry/syscall_64.c:94
>     entry_SYSCALL_64_after_hwframe+0x76/0x7e
>     </TASK>
>
> Similar to previous commit 57f312b95593 ("i2c: rtl9300: Fix out-of-bounds
> bug in rtl9300_i2c_smbus_xfer"), the data->block[0] is used for length and
> it comes from user. Add check for the variable to avoid out-of-bounds bug.
>
> Fixes: 8a325997d95d ("i2c: Add message transfer tracepoints for SMBUS [ver #2]")
> Signed-off-by: Wang Liang <wangliang74@huawei.com>
> ---
>   drivers/i2c/i2c-dev.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
> index e9577f920286..b00961561134 100644
> --- a/drivers/i2c/i2c-dev.c
> +++ b/drivers/i2c/i2c-dev.c
> @@ -386,6 +386,12 @@ static noinline int i2cdev_ioctl_smbus(struct i2c_client *client,
>   		if (read_write == I2C_SMBUS_READ)
>   			temp.block[0] = I2C_SMBUS_BLOCK_MAX;
>   	}
> +
> +	if (temp.block[0] > I2C_SMBUS_BLOCK_MAX) {
> +		dev_dbg(&client->adapter->dev, "block[0] out of range in ioctl I2C_SMBUS.\n");
> +		return -EINVAL;
> +	}
> +
>   	res = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
>   	      read_write, command, size, &temp);
>   	if (!res && ((size == I2C_SMBUS_PROC_CALL) ||


ping



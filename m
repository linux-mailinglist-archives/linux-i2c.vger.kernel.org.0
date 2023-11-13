Return-Path: <linux-i2c+bounces-99-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BC67E95B2
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 04:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14D171C209D6
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 03:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6344D848D;
	Mon, 13 Nov 2023 03:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="P1THUFvd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9570E79D8
	for <linux-i2c@vger.kernel.org>; Mon, 13 Nov 2023 03:46:39 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D19C111;
	Sun, 12 Nov 2023 19:46:38 -0800 (PST)
Received: from [10.3.2.161] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dmitry.osipenko)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 383FB66071EF;
	Mon, 13 Nov 2023 03:46:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699847196;
	bh=IYaMjc+qTvS7LQ5LbfeS/pcvc+pAiE5iS07jfl+bqtU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P1THUFvdl7/Ghu3ZCKMSYlY0BKgMc5jnQG09WFUrEnHyat1Chjki2Nxy+kJ/lHGbg
	 Z3BfdVGX59JeHi89FD8K21PFJMbKAtlnS9y7PQfAr82wZAHVzFI1DDiaGCnGW+16Ky
	 STN28oMW55Wb0lXmvUYSawOvUxo0uFCzHZAJuEYOPHo18TSWZTZ+t7BL9WB8D+TK7Z
	 23xbXofCSRGr7aRzMVc7axNMxiA1xnsB6wOway4UzA+OwoNTosPGWsrlelXpD4OIGA
	 urFBrIdE6EonOvKSmoSajswDJL8uLxEe8cuz8fMwjrsxuqt6OlmbFw11/VyB34cq/o
	 6uyb22O/c/vwQ==
Message-ID: <69941f8e-de1f-0319-6729-58625b362b8e@collabora.com>
Date: Mon, 13 Nov 2023 06:46:30 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v7 2/5] i2c: core: run atomic i2c xfer when !preemptible
Content-Language: en-US
To: Chris Morgan <macroalpha82@gmail.com>, Benjamin Bara <bbara93@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>,
 rafael.j.wysocki@intel.com, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 peterz@infradead.org, jonathanh@nvidia.com, richard.leitner@linux.dev,
 treding@nvidia.com, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, Benjamin Bara <benjamin.bara@skidata.com>,
 stable@vger.kernel.org, Nishanth Menon <nm@ti.com>, heiko@sntech.de,
 max.schwarz@online.de
References: <20230327-tegra-pmic-reboot-v7-0-18699d5dcd76@skidata.com>
 <20230327-tegra-pmic-reboot-v7-2-18699d5dcd76@skidata.com>
 <655177f4.050a0220.d85c9.3ba0@mx.google.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <655177f4.050a0220.d85c9.3ba0@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/23 04:12, Chris Morgan wrote:
> On Sat, Jul 15, 2023 at 09:53:24AM +0200, Benjamin Bara wrote:
>> From: Benjamin Bara <benjamin.bara@skidata.com>
>>
>> Since bae1d3a05a8b, i2c transfers are non-atomic if preemption is
>> disabled. However, non-atomic i2c transfers require preemption (e.g. in
>> wait_for_completion() while waiting for the DMA).
>>
>> panic() calls preempt_disable_notrace() before calling
>> emergency_restart(). Therefore, if an i2c device is used for the
>> restart, the xfer should be atomic. This avoids warnings like:
>>
>> [   12.667612] WARNING: CPU: 1 PID: 1 at kernel/rcu/tree_plugin.h:318 rcu_note_context_switch+0x33c/0x6b0
>> [   12.676926] Voluntary context switch within RCU read-side critical section!
>> ...
>> [   12.742376]  schedule_timeout from wait_for_completion_timeout+0x90/0x114
>> [   12.749179]  wait_for_completion_timeout from tegra_i2c_wait_completion+0x40/0x70
>> ...
>> [   12.994527]  atomic_notifier_call_chain from machine_restart+0x34/0x58
>> [   13.001050]  machine_restart from panic+0x2a8/0x32c
>>
>> Use !preemptible() instead, which is basically the same check as
>> pre-v5.2.
>>
>> Fixes: bae1d3a05a8b ("i2c: core: remove use of in_atomic()")
>> Cc: stable@vger.kernel.org # v5.2+
>> Suggested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> Acked-by: Wolfram Sang <wsa@kernel.org>
>> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> Tested-by: Nishanth Menon <nm@ti.com>
>> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> 
> For kernel 6.7 I'm having an issue when I shutdown or reboot my
> Rockchip RK3326 or Rockchip RK3566 based devices, and I've bisected
> the issue down to this specific commit.
> 
> When I shutdown or restart the device, I receive messages in the kernel
> log like the following:
> 
> [   37.121148] rk3x-i2c fdd40000.i2c: irq in STATE_IDLE, ipd = 0x3
> [   37.122178] rk3x-i2c fdd40000.i2c: irq in STATE_IDLE, ipd = 0x3
> [   37.123212] rk3x-i2c fdd40000.i2c: irq in STATE_IDLE, ipd = 0x3
> [   37.124226] rk3x-i2c fdd40000.i2c: irq in STATE_IDLE, ipd = 0x3
> [   37.125242] rk3x-i2c fdd40000.i2c: irq in STATE_IDLE, ipd = 0x3
> [   37.126133] rk3x-i2c fdd40000.i2c: irq in STATE_IDLE, ipd = 0x1
> 
> The device will also occasionally freeze instead of rebooting or
> shutting down. The i2c errors are consistent, but the freezing
> behavior is not.

I couldn't reproduce your issue with v6.7-rc1 and RK3399 that also uses rk3x-i2c. Though, the rk3x-i2c driver looks suspicious. Please try this patch:

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index a044ca0c35a1..aad00e9909cc 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -219,6 +219,8 @@ struct rk3x_i2c {
 	enum rk3x_i2c_state state;
 	unsigned int processed;
 	int error;
+
+	int irq;
 };
 
 static inline void i2c_writel(struct rk3x_i2c *i2c, u32 value,
@@ -1090,8 +1092,10 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
 		rk3x_i2c_start(i2c);
 
 		if (!polling) {
+			enable_irq(i2c->irq);
 			timeout = wait_event_timeout(i2c->wait, !i2c->busy,
 						     msecs_to_jiffies(WAIT_TIMEOUT));
+			disable_irq(i2c->irq);
 		} else {
 			timeout = rk3x_i2c_wait_xfer_poll(i2c);
 		}
@@ -1236,7 +1240,6 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
 	int ret = 0;
 	int bus_nr;
 	u32 value;
-	int irq;
 	unsigned long clk_rate;
 
 	i2c = devm_kzalloc(&pdev->dev, sizeof(struct rk3x_i2c), GFP_KERNEL);
@@ -1299,11 +1302,14 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
 	}
 
 	/* IRQ setup */
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	i2c->irq = platform_get_irq(pdev, 0);
+	if (i2c->irq < 0)
+		return i2c->irq;
+
+	/* interrupt will be enabled during of transfer time */
+	irq_set_status_flags(i2c->irq, IRQ_NOAUTOEN);
 
-	ret = devm_request_irq(&pdev->dev, irq, rk3x_i2c_irq,
+	ret = devm_request_irq(&pdev->dev, i2c->irq, rk3x_i2c_irq,
 			       0, dev_name(&pdev->dev), i2c);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "cannot request IRQ\n");


-- 
Best regards,
Dmitry



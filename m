Return-Path: <linux-i2c+bounces-14874-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E8CCE96E3
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 11:40:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B4263015005
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 10:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8142E262D0B;
	Tue, 30 Dec 2025 10:40:03 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA74F1E1C02;
	Tue, 30 Dec 2025 10:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767091203; cv=none; b=f8TYOxOZnl4wo8x+U7dQ+CtWgP//ZxSOExHREtgYl2NjwxTPHj3E5KDrlRa3Cj1+NqcfWDlHxB8tMCtir88t+CEI6b/ipI7o2PmdzGdkZL1K55mUENqQnzGbEXkbogHds7uBItU+xK+/fiErdCuwG3GkAF9PlHgFB14RHikaINk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767091203; c=relaxed/simple;
	bh=r3XoRx7YycajDewqZW4Knn2ldu5+li55I1qszS5kchE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CC+/OefiD4cjddqSCVtyuFnivS5kBGlpXJ3+myskpiVMG7EFkvNzA/g/fjXkuLQoP5UHTf7No8EwYX7MYtPVMV2v0mbF40kRdsMdiHWneesyCjd/Pq3XCMBFqbo7L9/TNyrSMbCn8Prjmdl0KYv+uLdoFXuU/Lou9ujll2bbUiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.1])
	by gateway (Coremail) with SMTP id _____8BxWcL3q1NpA2AEAA--.13368S3;
	Tue, 30 Dec 2025 18:39:51 +0800 (CST)
Received: from [10.161.0.102] (unknown [223.64.69.1])
	by front1 (Coremail) with SMTP id qMiowJCxecHxq1NpBrMGAA--.2502S2;
	Tue, 30 Dec 2025 18:39:49 +0800 (CST)
Message-ID: <452b58c1-38b7-49a5-b2d7-4f9fd9f33b4d@loongson.cn>
Date: Tue, 30 Dec 2025 18:39:45 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] i2c: ls2x: use i2c_adapter_set_node()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Lixu Zhang <lixu.zhang@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 Hans de Goede <hansg@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20251223-i2c-ada-dev-set-node-v1-0-2e36e0e785b4@oss.qualcomm.com>
 <20251223-i2c-ada-dev-set-node-v1-5-2e36e0e785b4@oss.qualcomm.com>
From: Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <20251223-i2c-ada-dev-set-node-v1-5-2e36e0e785b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowJCxecHxq1NpBrMGAA--.2502S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEMCGlTabUFRwABsh
X-Coremail-Antispam: 1Uk129KBj9xXoW7JF4ftw1kKr48Wr18Kw48AFc_yoWkurc_Cr
	1vv3Z7Jrn8Ar95Jw15JFW5Zr93Ka1Dur4kuF18t34SyayYqw1fJrWDXas5Ww4jqrsIgF45
	Kw1UXa1Sy3srGosvyTuYvTs0mTUanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbfkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcApnDUUUU


On 2025/12/23 18:06, Bartosz Golaszewski wrote:
> Use the dedicated wrapper for setting the fwnode of the i2c_adapter.
> This allows us to hide the dereferencing of the embedded struct device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Binbin Zhou <zhoubinbin@loongson.cn>

> ---
>   drivers/i2c/busses/i2c-ls2x.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-ls2x.c b/drivers/i2c/busses/i2c-ls2x.c
> index b475dd27b7af94a22537f1000e95606774d6c7f2..217a55d7d90b2e515ef33e9014263958d9258b00 100644
> --- a/drivers/i2c/busses/i2c-ls2x.c
> +++ b/drivers/i2c/busses/i2c-ls2x.c
> @@ -312,7 +312,7 @@ static int ls2x_i2c_probe(struct platform_device *pdev)
>   	adap->owner = THIS_MODULE;
>   	adap->algo = &ls2x_i2c_algo;
>   	adap->timeout = msecs_to_jiffies(100);
> -	device_set_node(&adap->dev, dev_fwnode(dev));
> +	i2c_adapter_set_node(adap, dev_fwnode(dev));
>   	i2c_set_adapdata(adap, priv);
>   	strscpy(adap->name, pdev->name, sizeof(adap->name));
>   	init_completion(&priv->cmd_complete);
>



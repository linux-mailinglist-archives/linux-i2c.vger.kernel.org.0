Return-Path: <linux-i2c+bounces-558-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E11BA7FE647
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Nov 2023 02:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73A1AB20BCA
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Nov 2023 01:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8BF79E1;
	Thu, 30 Nov 2023 01:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-i2c@vger.kernel.org
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDFA81A5
	for <linux-i2c@vger.kernel.org>; Wed, 29 Nov 2023 17:39:23 -0800 (PST)
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4Sgf4Q2Fqvz4f3jHt
	for <linux-i2c@vger.kernel.org>; Thu, 30 Nov 2023 09:39:18 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 47B6D1A081B
	for <linux-i2c@vger.kernel.org>; Thu, 30 Nov 2023 09:39:20 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.103.91])
	by APP1 (Coremail) with SMTP id cCh0CgDHyhDD52dlWRdCCQ--.15748S4;
	Thu, 30 Nov 2023 09:39:20 +0800 (CST)
From: Yang Yingliang <yangyingliang@huaweicloud.com>
To: linux-i2c@vger.kernel.org
Cc: agross@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	andi.shyti@kernel.org,
	wsa@kernel.org,
	neil.armstrong@linaro.org,
	yangyingliang@huawei.com
Subject: [PATCH] i2c: qcom-geni: fix missing clk_disable_unprepare() and geni_se_resources_off()
Date: Thu, 30 Nov 2023 09:43:24 +0800
Message-Id: <20231130014324.2483816-1-yangyingliang@huaweicloud.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgDHyhDD52dlWRdCCQ--.15748S4
X-Coremail-Antispam: 1UD129KBjvJXoW7KF4fGFy3WrW3KryDCFWUtwb_yoW8WFy8pw
	s7GFZ0kw48WF4a9rn8XwsrZa4YyayjqFW8Kr45G3W3Wa13Xr9FqrnIqa4Y9Fn5AFWIkw17
	Xr4DKryxAFyDCFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUgKb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCj
	c4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJV
	Cq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBI
	daVFxhVjvjDU0xZFpf9x07UQzVbUUUUU=
X-CM-SenderInfo: 51dqw5xlqjzxhdqjqx5xdzvxpfor3voofrz/

From: Yang Yingliang <yangyingliang@huawei.com>

Add missing clk_disable_unprepare() and geni_se_resources_off() in the error
path in geni_i2c_probe().

Fixes: 14d02fbadb5d ("i2c: qcom-geni: add desc struct to prepare support for I2C Master Hub variant")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 6d829ed2f868..0d2e7171e3a6 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -858,6 +858,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	ret = geni_se_resources_on(&gi2c->se);
 	if (ret) {
 		dev_err(dev, "Error turning on resources %d\n", ret);
+		clk_disable_unprepare(gi2c->core_clk);
 		return ret;
 	}
 	proto = geni_se_read_proto(&gi2c->se);
@@ -877,8 +878,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		/* FIFO is disabled, so we can only use GPI DMA */
 		gi2c->gpi_mode = true;
 		ret = setup_gpi_dma(gi2c);
-		if (ret)
+		if (ret) {
+			geni_se_resources_off(&gi2c->se);
+			clk_disable_unprepare(gi2c->core_clk);
 			return dev_err_probe(dev, ret, "Failed to setup GPI DMA mode\n");
+		}
 
 		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
 	} else {
@@ -891,6 +895,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 
 		if (!tx_depth) {
 			dev_err(dev, "Invalid TX FIFO depth\n");
+			geni_se_resources_off(&gi2c->se);
+			clk_disable_unprepare(gi2c->core_clk);
 			return -EINVAL;
 		}
 
-- 
2.25.1



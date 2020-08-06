Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C55E823D8E7
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Aug 2020 11:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729100AbgHFJtX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Aug 2020 05:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbgHFJsl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Aug 2020 05:48:41 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F350C061574;
        Thu,  6 Aug 2020 02:48:41 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id l2so32826649wrc.7;
        Thu, 06 Aug 2020 02:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=pQQbHRDXqKGonZmyfA/7H4FL5vlKcEV+QfkkDKraWtE=;
        b=dM1GCLp90nDRXLp2vBQkMHchQY/VB0Hl0yinYxzsStKhyeDUdDIRSOhlF8vCsf4yPr
         8192NiIdKfXofwr/WBi1KQTyQ+SJFKamXxfpj8yDxy5RzUWAuaPh/BKJO3PxeM+LO+/O
         b/zYTOKj2B5A8pWSFqWoh2s3kZkNnqfPJNxY8HKJhxWQW/GHP7IvF+yA8wyPSnNPOlfa
         enJgFTQdOx7wz/8vRiJWngQxGVbzv30hkrsy2bwErUSHueFpZoZ948cZriM6VhA3dmpv
         QvbAKqCTFOa/2R7MI4Xk6L+HDX0REwv3bxioVIDBcIVrBk7B8GE4rCctE9kiDQUyyjhf
         e4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=pQQbHRDXqKGonZmyfA/7H4FL5vlKcEV+QfkkDKraWtE=;
        b=gzuyisSIdrWyCD9uEwyksY9j009WfJcbRiQVzt0rlkMUu2vwv2hNi3Qs4wj0/0r3c7
         zgnANGQOLOswjUszFoWcxWQO1cKlZinlbt3MFreJIK6SUSFQJbNQEabqYjQ95QQJ5q7R
         c5zvccpKPqwSHUi+N/HnXKBBAm9DfXDMl6/SHsVZi8bggfiJCY1jCA9JHHhue8yEtuhv
         bOe3I6ZRMUQ+2sloCjSQUCgKSKgYluiMKBAF1SfaxCaC6zccntn337Wkq5jfy5K+BYFF
         QtFWCHQslZmOfyKcM8KoL0SoIkKJHuUJ+p2iGcEvInw5VVQqsf3KbuatJjBiwmwPcIo9
         n1Zg==
X-Gm-Message-State: AOAM533rA5y9U43W2lBK9NA4Ij1FF4d+FeJHpDiErDBtwgb+lMQ5+/kY
        u2FiNjcvoihXpt2D1Lh+RP+FjJNbyfo=
X-Google-Smtp-Source: ABdhPJy+IhnQM7YA6Ai0q9y4WNhairm37cfGCaJNnuPGVOSZRyFre9wihzJzR2mBEro2zDDT753Wbg==
X-Received: by 2002:adf:9e90:: with SMTP id a16mr7034449wrf.40.1596707319687;
        Thu, 06 Aug 2020 02:48:39 -0700 (PDT)
Received: from ziggy.stardust ([213.195.117.232])
        by smtp.gmail.com with ESMTPSA id v12sm5795282wrs.2.2020.08.06.02.48.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2020 02:48:38 -0700 (PDT)
To:     qii.wang@mediatek.com, wsa@the-dreams.de, yingjoe.chen@mediatek.com
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Matthias Brugger <mbrugger@suse.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] i2c: mediatek: Fix i2c_spec_values description
Message-ID: <c410f784-7b51-0d65-7a41-3845214dd273@gmail.com>
Date:   Thu, 6 Aug 2020 11:48:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The struct i2c_spec_values have it's members documented but is missing the 
starting '@', which leads to warings like:

drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member 
'min_low_ns' not described in 'i2c_spec_values'

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
  drivers/i2c/busses/i2c-mt65xx.c | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index e889f74703e4..f51b35fc400f 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -253,10 +253,10 @@ struct mtk_i2c {

  /**
   * struct i2c_spec_values:
- * min_low_ns: min LOW period of the SCL clock
- * min_su_sta_ns: min set-up time for a repeated START condition
- * max_hd_dat_ns: max data hold time
- * min_su_dat_ns: min data set-up time
+ * @min_low_ns: min LOW period of the SCL clock
+ * @min_su_sta_ns: min set-up time for a repeated START condition
+ * @max_hd_dat_ns: max data hold time
+ * @min_su_dat_ns: min data set-up time
   */
  struct i2c_spec_values {
  	unsigned int min_low_ns;
-- 
2.27.0

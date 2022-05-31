Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A655D5393E8
	for <lists+linux-i2c@lfdr.de>; Tue, 31 May 2022 17:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345618AbiEaPZ3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 May 2022 11:25:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345597AbiEaPZ3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 May 2022 11:25:29 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31C6D3617B;
        Tue, 31 May 2022 08:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654010728; x=1685546728;
  h=message-id:date:mime-version:to:cc:from:subject:
   content-transfer-encoding;
  bh=9K90yt7gi0QZROB3GtfrYs5hCiia1w1A1JaJHab+plo=;
  b=xLiUL/CSd4PnpzMlvc5uC8RsseA3pdVQ1nRwkFwoQKbKON97BIwCLqRp
   iaHoAZ7EOtHJQeiP3YuVfgObZUXCk6aM1MJgVqd0i+SEz73irrbGXakgG
   K0AKSB3ymXrs2tWzkINzA5U+dOFeMWzpF9uB92l6QRqL3JMHxjBBtrGYg
   I=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 31 May 2022 08:25:27 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 08:25:27 -0700
Received: from [10.110.116.173] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 31 May
 2022 08:25:26 -0700
Message-ID: <78873437-3b35-0711-a1dc-219b9f316fac@quicinc.com>
Date:   Tue, 31 May 2022 08:25:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To:     <linux-spi@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <broonie@kernel.org>, <wsa@kernel.org>
CC:     <linux-kernel@vger.kernel.org>
From:   Prasad Sodagudi <quic_psodagud@quicinc.com>
Subject: [Query] Looking for comments on CONFIG_SPI_SPIDEV and
 CONFIG_I2C_CHARDEV interfaces security
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi All,

I am working on an IoT solution and would like to understand security 
impact of these two CONFIG_SPI_SPIDEV and CONFIG_I2C_CHARDEV interfaces 
of Linux. If a driver is developed from userspace for  /dev/spiX.Y or 
/dev/i2c interfaces,  are there any security concerns ?

Userspace driver is to control external SPI slave on board. I heard that 
these interfaces allows access to any of these type of devices on board. 
  How to avoid accessing any of these type of unwanted device access 
from userspace ?  Can Selinux or any mechanism control access to other 
these type of devices from user-space ?

Please share your comments/findings on these two interfaces related to 
security. If community had posted any security related discussions with 
these interfaces, please share details to improve understanding.

-Thanks, Prasad

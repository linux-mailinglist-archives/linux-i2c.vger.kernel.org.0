Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2255723096F
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 14:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729434AbgG1MBn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jul 2020 08:01:43 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:40902 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729422AbgG1MBl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jul 2020 08:01:41 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06SBq3p2030328;
        Tue, 28 Jul 2020 14:01:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=45wPQfTuonuAouSiTUHv2fh5yzAchacs/wyy9C6PqAc=;
 b=qpjOrsP2CyiKBcpxAvVx9WhLezuK98Y6GAAGqQ6yOaIwnusaNXmNe0e/uYWF5D59b+/+
 W3R4l+bE2+VyHdwGW/gaZkpHOrQS2xQ/VKDh364FpamACKQwg3R9C3Hs4CSNvODnAbJZ
 h09UQQEY2pBLpfU0YSxGlGH5ILrT9iZupu4ZccmJDmQqqbJed7pyzDZ2wcJ53RCr+piR
 sn4f+LgfofdWUQgDgAFhS4rzf/ByTt6UJcgXsf8ND2/gJyrh7VynExD8dx884ikdIVuU
 zWcw+6KGPfDZu0Ww7deo0Wqe/Lr4vSXoa8e5DoHG4KjnHAtEFTHTfib4nKAC+iVv9rXX qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 32gbmg5y9m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 28 Jul 2020 14:01:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F39A710002A;
        Tue, 28 Jul 2020 14:01:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EBB5A2BF9C9;
        Tue, 28 Jul 2020 14:01:34 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.45) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 14:01:34 +0200
Date:   Tue, 28 Jul 2020 14:01:33 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 2/2] i2c: slave: add sanity check when unregistering
Message-ID: <20200728120133.GB8715@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
References: <20200725195053.14334-1-wsa+renesas@sang-engineering.com>
 <20200725195053.14334-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200725195053.14334-3-wsa+renesas@sang-engineering.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-28_07:2020-07-28,2020-07-28 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Reviewed-by: Alain Volmat <alain.volmat@st.com>

Alain

On Sat, Jul 25, 2020 at 09:50:53PM +0200, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/i2c-core-slave.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-slave.c b/drivers/i2c/i2c-core-slave.c
> index 549751347e6c..1589179d5eb9 100644
> --- a/drivers/i2c/i2c-core-slave.c
> +++ b/drivers/i2c/i2c-core-slave.c
> @@ -58,6 +58,9 @@ int i2c_slave_unregister(struct i2c_client *client)
>  {
>  	int ret;
>  
> +	if (IS_ERR_OR_NULL(client))
> +		return -EINVAL;
> +
>  	if (!client->adapter->algo->unreg_slave) {
>  		dev_err(&client->dev, "%s: not supported by adapter\n", __func__);
>  		return -EOPNOTSUPP;
> -- 
> 2.20.1
> 

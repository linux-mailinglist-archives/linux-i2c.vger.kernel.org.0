Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D00920F1AA
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jun 2020 11:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730714AbgF3JcF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Jun 2020 05:32:05 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:60912 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729193AbgF3JcE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Jun 2020 05:32:04 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05U9NmgO016151;
        Tue, 30 Jun 2020 11:31:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=l4SnfTz6ALle5A6so4k9LIpE7SfeF0TpncidqZF3610=;
 b=WZ5rpBhuwWnTUMeexGug1yaeaVGs1kH0hqSXe5XBBMkox46Z4995ah9SMQ88SSG0brca
 NWK0+XbSH1nilmX09QyCzmC6kVV2XuiFx8PW4zFfmM/X7VxX6tYgz3/F1Y2/X+zlhL6f
 jdfX4uQaBDH9cOQA3K3l9BFy829ugjVzqR1M2si7+QABimPAkPVAdSG6ZeF7f6e2mcH5
 cB/kUbd1DbCOa6NE73F+CaHkqZZKCV/ZFhl3ht4WyWSNtpx6YQSzIRVcOs0XMHY/GOGe
 dhhKcyOk1WohUPVY1r4BaICvmW0InO9KJvVwRRCjaO/EVRqxDxZFuD1cxbLEbAz0Jsmb xA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31wuk19r7s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 30 Jun 2020 11:31:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3CF31100034;
        Tue, 30 Jun 2020 11:31:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 00C992ADA04;
        Tue, 30 Jun 2020 11:31:36 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.44) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 30 Jun
 2020 11:31:36 +0200
Date:   Tue, 30 Jun 2020 11:31:35 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <pierre-yves.mordret@st.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: Re: [PATCH 4/4] i2c: stm32f7: Add SMBus-specific protocols support
Message-ID: <20200630093135.GC5652@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
References: <1588657871-14747-1-git-send-email-alain.volmat@st.com>
 <1588657871-14747-5-git-send-email-alain.volmat@st.com>
 <20200523110140.GD3459@ninjato>
 <20200526103938.GC14423@gnbcxd0016.gnb.st.com>
 <20200630064050.GA996@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200630064050.GA996@ninjato>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-06-30_03:2020-06-30,2020-06-29 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

> I meant a generic binding for the host-controller. It could be seen as a
> HW description if we need HostNotify on that bus or not.
> 
> Maybe it becomes more clear with the R-Car I2C controller as an example.
> It only supports one slave address. If I want HostNotify there, I can't
> use another slave backend. Now, it could be that I need the slave EEPROM
> backend, although there is a HostNotify capable device on the bus. So, I
> am leaning to have a generic "host-notify" binding for the host.
> 
> I consider platform_data legacy. If we use device_property, we should be
> safe regarding all current and future HW descriptions, or?

Ok, understood. Fine for me that way as well. I am just a little worrying that
the "host-notify" can now be present in both controller AND slave nodes
and might be a bit hard to understand. At the same time I don't have a better
proposal for naming the binding for the controller.

Please do not consider serie v2 I just posted few days ago and I will
post a serie v3 updating the binding information and using the host-notify
binding in the i2c-stm32f7 driver.

Alain

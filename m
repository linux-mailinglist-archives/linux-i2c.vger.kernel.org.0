Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2BCE38E12E
	for <lists+linux-i2c@lfdr.de>; Mon, 24 May 2021 08:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232128AbhEXGug (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 May 2021 02:50:36 -0400
Received: from mail-co1nam11on2064.outbound.protection.outlook.com ([40.107.220.64]:35482
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232120AbhEXGug (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 May 2021 02:50:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqHhApfmld5Qm9u62KrMeNHdbCY9Lv96y++sX4zaw0KSvvagnpDYh56qVQm8gmLVYzTXryhK5B+Yq8XdLwlsThjFb+lD4i1ZetonwK1quP5XKHbRBFrCwepJuFxsjTV6n/eAzaibdRQ0xulUdFXnQLFLWyc2mp0fDhQg6ENLFeaQrD8MKu4V8yeeFhfm81lvy88YyvJ2F2d07h5NFT4vVN/RVMTmPfiQGS2CP+W1B8jx4+KPV+ZtcklOyIYDlwZJ3QhJfOtm2ArOWcFtXDfbDSzYxNtWK12f3fOwjGHtI3hYO2wqI4pKh+0lsZfRw00H/FSFTsir/cB0To4rimjLxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8q1GB4FfR9qK7Z4CGY06M7Yp+ytz6O3efNWj7nNWgwU=;
 b=m95fq0J3oZHXSDEa8Bc3NvIOKRp0Gt3IJJjs16D3Zf8XERcbpoy3hgwLaJAKITfBn03fnVmNoi/ucRCE/a6j/jNhib8NMovUAjHqXqOU1Q4D1LJImAfGlnWh9Ow2d1giXPc7XRqUO/zq2lulCJk9ngpu1oWU+n7Egwvw2frk4+xl0G0pqDfg/0dWL/oBvIWCq4A80likPzq22UL621K7Vy10BNcsMuHazlniEsQ92pxuC01lJ2+O4kh45wcCBIN3fsnmmW6fLKswil/GYMdC+peeNZacZDCysMtweKBfKmKZX42gUQ6B0iCHL+2ncSo88OrPx2jsTdp+juBRJOmTsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8q1GB4FfR9qK7Z4CGY06M7Yp+ytz6O3efNWj7nNWgwU=;
 b=f0SQVA9GcTOg+1Ee8/Kmessl5Ndr+NGBDv+DT9Ee0/FY+5Z9OUNry7CZYdSC60Go74aMsiZxLXDNbeID/2xIR5vJGa18X8KtzohTjO5heWlGiBHx4MBOAblqnOeQIVTqCzG7BeXzBCGxT7LqC+DIfZ0pEds64PshoAG05TZRScY=
Received: from SN7PR04CA0004.namprd04.prod.outlook.com (2603:10b6:806:f2::9)
 by BN0PR02MB7903.namprd02.prod.outlook.com (2603:10b6:408:162::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Mon, 24 May
 2021 06:49:06 +0000
Received: from SN1NAM02FT0054.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:f2:cafe::6f) by SN7PR04CA0004.outlook.office365.com
 (2603:10b6:806:f2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend
 Transport; Mon, 24 May 2021 06:49:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0054.mail.protection.outlook.com (10.97.4.242) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4129.27 via Frontend Transport; Mon, 24 May 2021 06:49:06 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 23 May 2021 23:49:04 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Sun, 23 May 2021 23:49:04 -0700
Envelope-to: linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 lee.jones@linaro.org
Received: from [172.30.17.109] (port=45088)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1ll4Oe-0005Rv-3G; Sun, 23 May 2021 23:49:04 -0700
Subject: Re: [PATCH 06/16] i2c: busses: i2c-cadence: Fix incorrectly
 documented 'enum cdns_i2c_slave_mode'
To:     Lee Jones <lee.jones@linaro.org>
CC:     <linux-kernel@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-7-lee.jones@linaro.org>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <2742a590-c0f0-d32f-88d8-558ac0ff6bd0@xilinx.com>
Date:   Mon, 24 May 2021 08:49:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210520190105.3772683-7-lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc04cb4b-e233-4041-3765-08d91e8006b1
X-MS-TrafficTypeDiagnostic: BN0PR02MB7903:
X-Microsoft-Antispam-PRVS: <BN0PR02MB790325F08829E30B451EF735C6269@BN0PR02MB7903.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MEZnlHg9HgU47Mag0KL3l0KAigNsbLZdyZQi2Pp73FoaECRymFvnHEwXq+DShOPlOiJat2DVBH4lxKFznCJlCdTs1a7SschndwK9IZ4Y3L0PpPD/JQEoOrUtlkmibNkMWHdY4Qfa/+PrR9tKzYfrWw0ZMry5+RHqhyC0GBReF+EVr+qhjvWapwmg7Rem/kkonj8MgJpFFPVfgKFzCMkyhvUasjOBVc+7xmlQYVioXK2AgqxaUw7rzzr9J4tpGzDRwcOTDnA7q+/kEFhMAurjRUoWfhdmVCOWC2YVcTDptQ1aycTAd4g2Mq5OOl8wtCBQk6TKZ42zTK0AdHwaKFD1WIadCUfOXnzNX1yrq4lGAhcCtOIdjAi/lgn2FIdeDwLd8xQlLjmZJn03RYrRS4gF88KfxTg8No3sqwdKLWlK2DkqTl41bJ66PhAU5O/Sn7kux4C3CScglf0Tz2VPviD9/jmQCjdufbSb3y9qEVXV7oZ+Ty1dZd9UuMvyKF/XCDCRtE9eZ8WwbbGrqUBrnMyFMaS+RkmnIK6zrdwm3kJkx9Iz6W3hNwIRXQD2JxwHguzT0UG3F4W6nrn4K06f8oC1hyXJdzb0/AmFOWgS1HQbu6I82RGw8Vn0R1hJhY1M1e5RbNISCUuv45RP/bcyQL/THEdQzfAoOQVyPrRb3kfpiBnFvqq3UM2PWeaIlEf1HDHEEzjxR4u3LrbRUyekXwMDp610A1s2xAnWr7L867R7VcSKm8OTCGwXJcvY/p29YxDC
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39850400004)(46966006)(36840700001)(478600001)(83380400001)(47076005)(5660300002)(31696002)(186003)(70206006)(44832011)(9786002)(53546011)(2616005)(4326008)(7636003)(82740400003)(70586007)(316002)(31686004)(54906003)(8936002)(426003)(356005)(36860700001)(36756003)(82310400003)(36906005)(6916009)(26005)(8676002)(336012)(2906002)(70780200001)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 06:49:06.5760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc04cb4b-e233-4041-3765-08d91e8006b1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0054.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB7903
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 5/20/21 9:00 PM, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/i2c/busses/i2c-cadence.c:157: warning: expecting prototype for enum cdns_i2c_slave_mode. Prototype was for enum cdns_i2c_slave_state instead
> 
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/i2c/busses/i2c-cadence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index c1bbc4caeb5c9..66aafa7d11234 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -144,7 +144,7 @@ enum cdns_i2c_mode {
>  };
>  
>  /**
> - * enum cdns_i2c_slave_mode - Slave state when I2C is operating in slave mode
> + * enum cdns_i2c_slave_state - Slave state when I2C is operating in slave mode
>   *
>   * @CDNS_I2C_SLAVE_STATE_IDLE: I2C slave idle
>   * @CDNS_I2C_SLAVE_STATE_SEND: I2C slave sending data to master
> 

Reviewed-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal

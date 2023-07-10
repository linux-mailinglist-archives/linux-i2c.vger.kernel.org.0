Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0E6674CD17
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jul 2023 08:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbjGJGex (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jul 2023 02:34:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231493AbjGJGeh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jul 2023 02:34:37 -0400
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2103.outbound.protection.outlook.com [40.107.255.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E6FFE56;
        Sun,  9 Jul 2023 23:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSSkzYRTuk6VSXb1xheNlM64n+674HQafmvzCkTFkOGqiqoajVuEQa0/ntcw9HwlV/UHjpOSYon/uJcrqgDA9/3jirz6PSU+8sXFyn+hWn0QWLecRx04vJ1p2SPuvntqKdSmpCvirYo4e9gSkmATijshl72aPFfn4GtKFJwvFzhie7PWXOxQPU/KOVs6omKm9lAjUpjWLwhjkxOqtl4/uEC69AnOYIFYiZ4W9js6xNybpmU2oIvk78PUfeyn6O7BbAeZHyux3Vg6lXrNctBKTa2DWQY2AezdFGJeIz0JAwbWDL46YOthlVKjIeawsfIZCGDo2wHm2z0mtroa7Dm7Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdb26EYaPAoprJFKtW/qFt1bUD6rf5cw+jKBZQC71QQ=;
 b=k5E4WXBRbEdzadbPzanbwQVEnEG5G6BizJs0tTmSrSvHkvQMHXnS2sw2uSIaoD0068NPXKlPcuUar4yijOhIEDTo7M+72yiRyBn2jkDyqaUyV6njktnEjc6Gkm27zhfnnzcAlHy0o7tYRfsjk1V6aGWI26Fs5I0PoojJiHXHtSwK7s57iHyzNo+q30qPZ+tDqiGeD3fVTfgfHeElV8yE6cyJLbaLaCVh5fKTgq9gd+hTGdVFUxHT88773lKr2O6MLzzYwlNGT9bI+hPcem2bNOfvRiTipme6TyrZUyZxH2Wr+8iDuyYvb3SDNcKXqRHkrk0M3n2eo7iCYGgyrn/iKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdb26EYaPAoprJFKtW/qFt1bUD6rf5cw+jKBZQC71QQ=;
 b=mabQYwHghQB4bFolHew9/efmWbZ6guXuTHKMAvr3sa+AzWnCDEuoHuDMl/JJOMYpzaz1hyFqDx+5Yy/eZTM3VB/3FyESWGEakzZWNdblnSl7VOu/DxB9N9D1i5SQlcwQlrEVi/Oq9yFH62hKVGnME1LdQG/8tvGVOWDsP0hTQRvPfSUsAuNkd+VuBCft1WdOjsOh2Hzs3UEKqhA5+qpzoeutDkRrWi+nUrQT8CZQZ3VQeF++4eWzWJjdH9HxcqE9RczGRv56UH50+kuNldW/CjadMnFwLKcuiSOfgz9aSADv/4f8lEOdv2n/rk8vIjGmU3v5Muza66eZe3JzVIPANQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6586.apcprd06.prod.outlook.com (2603:1096:101:175::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 06:34:15 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 06:34:15 +0000
From:   Yangtao Li <frank.li@vivo.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Yangtao Li <frank.li@vivo.com>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/11] i2c: qcom-geni: Convert to devm_platform_ioremap_resource()
Date:   Mon, 10 Jul 2023 14:33:45 +0800
Message-Id: <20230710063351.17490-6-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230710063351.17490-1-frank.li@vivo.com>
References: <20230710063351.17490-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::14) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB6586:EE_
X-MS-Office365-Filtering-Correlation-Id: dd72630b-db8a-4a22-1388-08db810fae22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r9hxxLy4/Zo1BnrR1jFjsnktwE1OSZX5QwO1xwcsja4331jE1BdTCE8v+6j2cDMQ+Az+RtvOvfZk/FQAJp8ANg00fhGvQ3/EnHuVHt4zuGDnhizCirvKJ+1z3eIYguh5iMilOKr9UylQhQ8+i3qw4yBkOl8aSEKUgpnL7vuJn2IlaEr+TCRsm90M2p9rJFNdqYqT+QWzo9RvaVkWvOOl9tvSmENtX/IZoF9w9wXqkJerwevGNLlX5vTXWzJHcdXds3OCXGuyaEa4U3oBDT7UnmfHa5du8WTUW+pdotm/Q/XJerC25Axf775AeRHL/UdKbfqz9eupoiw8FGBIg6+4g50yb489edW7++7YSvHc/liOb7vfRRcekEo44yOc7iopRZIjMeue/PWqIXM0UpDv/eVu/pSBQ8+1n7INWyp2zOot+558OON/b8Um887UL84hoS2KVJNX0MmZOZFpECUnTyXhr7+2V7y5+NDDR8dpKveC9BqNXx9/+5qrWsZfc8jhINjz8PwRi6BhfK8cbNyy2TJv2wNYPZvB2t+xIh5ybsKQ9os/r0v/8Ua+aj3m0J8iJYdpsBJYb9r18I66Nx9RaYI6XsLIFu+O6xBHcah11waImcp8Dh8ZbtLWrXLUW9ZDP54avzm6yoe5uP/bNK3Cql1O8snNlcSpCjYtwPBR7Qk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199021)(52116002)(6486002)(478600001)(6666004)(110136005)(83380400001)(36756003)(86362001)(2616005)(2906002)(66946007)(186003)(6506007)(1076003)(26005)(6512007)(38350700002)(38100700002)(8676002)(4326008)(316002)(66556008)(66476007)(41300700001)(5660300002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LNWDGnA1XAKixWBrA/WgVfT8L0PvUD1RwfCvdvdhEAXFbNdZ8Ekj7ZECpbxw?=
 =?us-ascii?Q?pCc1KKQqwupgJ5d5DtXGWjv8onh5lip4OnRHbFd9St3DHRhwR2oA+Gs3IiN9?=
 =?us-ascii?Q?Dc1FUvyXULd0E3muXyvHSmw08b4QflvxfnYgrG/1n/MdNYCNDZLq0PqLYFPP?=
 =?us-ascii?Q?vK4LtNRefrBI2hQkHcfiz4G5JvaoazdvJLFXRlCs6klHFdKXoRPCZS1BmXy4?=
 =?us-ascii?Q?hWxIF0AOT695L7GEH6iaydKakMm3g7RK0HmYZOcqxQxNwGNuY8GkwZl+Jk6h?=
 =?us-ascii?Q?ixKXKF3R0j+dFaXLEAIueijXAAG+VtsVZYWZKskUzV4q5ctcOSn3LwGAiakt?=
 =?us-ascii?Q?RUpd7U210rXbUVNMF61wXwSWo6QeE3yLDBOcNsW4XsVAkgC3FY7DM7nGI3aG?=
 =?us-ascii?Q?QwRmBbB/JD1+JKob1g2GqpgVs0klh28hy0YEZmnq9T2tdvIblvcrLdFuVHRv?=
 =?us-ascii?Q?zgJc7eAdAgeRWCoNLNFs2C3jB7IiCwpGIkJtYzraWjHZ//w6Ck1EdxjuL+a3?=
 =?us-ascii?Q?2OzWaBQ/GPK3hkpSx3qdJ5fx7ExJ5GQkH8Lnl/37FAnExvWHZHWu6J/aa2OC?=
 =?us-ascii?Q?6Z8fe67m79E9kKghdCSKCJDHxxRizx0xVj+R9MuDyxqh8awiMd7/gGgi/nD/?=
 =?us-ascii?Q?n8L9863Q+WX1KfH/PzqM+CW7f14BMSGjTrXMV7wyXtXIzPNTvrInyUyrv0dZ?=
 =?us-ascii?Q?Nj96RP0VK8Sk9WwubKjUCUpBQckDSAldIfX1SaJFKEx990C8U1tEm5wUfjTj?=
 =?us-ascii?Q?Jkz0c2p4gU0AhoAe5qL/NYIWZyKIEBRZ6k/U/PwFZtIMQC9A6K1Pv3msdzPa?=
 =?us-ascii?Q?fWSsmM0FMFmq/+usAaagf6aosLXIaKRE/U4ay6NWR/rRdrgHj3sNHgxrI1bL?=
 =?us-ascii?Q?ZWjI/M2llF1d/fpm6InL5aKpfEqYRmFOA2cQMmqTRjhAvgVqcpCeKEqPd8BK?=
 =?us-ascii?Q?PGcLhAKygAXo5XcXi7t9AOTlSiwf5uvmLDECq4r2JMwDkjqTC0c7BBcJ+4XL?=
 =?us-ascii?Q?flluFlvbWTXI36aq/nRAv34Mw/mTGngZwbc+e2Z6F183l8rinJD6nSUDDrxb?=
 =?us-ascii?Q?wWfpujABnUViD7qkRFBAu9My1Gw5xCNTTgPMGVGsApdiJ4NVntESPAh3pKRM?=
 =?us-ascii?Q?RhEa1vMz0hYfbm0PD8CREuqO1IYono4N4RXPardXmBK5ejMeaj3ja4DXKxxa?=
 =?us-ascii?Q?QYipyzh9PA7a6SWfbBGG/FDdKcq6dTbGwT3UD0LxuhnxvC2kt7zvIQnC7dHO?=
 =?us-ascii?Q?QzmooXrDB6AqBiL/wMymbjt6tViJE9Z2LkuESIXbEzlpc1IC3RdOcnQMz9v0?=
 =?us-ascii?Q?xRLYb0vet1sFTtp5EML6hljWz/VsCwdUTalR+wv0fjyd6Qg/L5z0qB204ZSQ?=
 =?us-ascii?Q?9j7wmgoPDXo6NpR5xGPmVcrONrsfYEsrgPHdf9dktmhMJUpSbnbqMW9kgMpv?=
 =?us-ascii?Q?UefR+8OpW+kKSc7M+YlrApDEqNaUTOuWkrtXK4Ratui1GEa4thtFct6Cra0v?=
 =?us-ascii?Q?eE7pc4hW1dwt85ylQR46nhDofUaogxT09sz+YdSyYVzBaxmq/fkxSOmyRBip?=
 =?us-ascii?Q?mWXAnPVwDO+bSGW9Quqq6P/IVoc/sq1PF8qtLYus?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd72630b-db8a-4a22-1388-08db810fae22
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 06:34:15.1261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LWyxP8IV6GpFNuhkneUIL4aZhS1DbgxIKJJqijOrx2PhUGn1dVr7q9ogGKnNqNS6VFU/l+txwUVFkbFAi9mElw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6586
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index b670a67c4fdd..229353e96e09 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -767,7 +767,6 @@ static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
 static int geni_i2c_probe(struct platform_device *pdev)
 {
 	struct geni_i2c_dev *gi2c;
-	struct resource *res;
 	u32 proto, tx_depth, fifo_disable;
 	int ret;
 	struct device *dev = &pdev->dev;
@@ -779,8 +778,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 
 	gi2c->se.dev = dev;
 	gi2c->se.wrapper = dev_get_drvdata(dev->parent);
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	gi2c->se.base = devm_ioremap_resource(dev, res);
+	gi2c->se.base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(gi2c->se.base))
 		return PTR_ERR(gi2c->se.base);
 
-- 
2.39.0


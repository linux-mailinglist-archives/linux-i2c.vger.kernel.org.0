Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20BA168B677
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Feb 2023 08:33:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbjBFHdA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Feb 2023 02:33:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbjBFHc6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Feb 2023 02:32:58 -0500
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2060.outbound.protection.outlook.com [40.107.96.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F3193592;
        Sun,  5 Feb 2023 23:32:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tc/RbmEbgpksxQGKDBNosIZhMeqqSjPkVipUW6Xz8K7QjEQ7sUhkKsDma8zaB+yu0/Oko/O56IR1wWx/o9SAFP+iUTM8PETAK3jvQzK6K24A1w6/y1XW88HHsO18utZ8fJJhOi9eGz1MzWKJYKWFJAes6PNzI/Z1Tq7zlJVWK4lqctQoCKJROGeTkrfmdJrle54LSClEGEwmbtVJ/XqXrHzzaGhR5P7Aqe9FOtOFiWluAIOFr/3uqFsrzAhpyxuEQ/HamyPbswqOPfhWTnUR6gNTat/ILGSuRTgDivr6nVxN82SgLmCAdhJJB5uokR8DFuTLyPnNPqBwDUMaQMJttA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIR9oHHD023JSdyFHUvLum5NJrGYcwyHcz83+GjFAIk=;
 b=L8HwlGeyNuxPesXKmXo2VrMzhlAxqITOdcQSww0747YBHYy3W1VOnoZc3B705q1cPY/z6oZuY9bSwUuhZeXKp4bCi4C066mfCtBD2qU5Y1hpaqVHC7hzhyF+ZDk+Qvjnps93Z+dfuE2D2HizQ++XvcqqeL8kHXHXstUXMU08hz/0s68+qwdj23u1GWE+FzUCQHAjPNl6HNDrqOolpPGTOEPsilTcV6NlEK8sH3ypHHnAnP5BiTMg3y/wF30YIUsGZ1aHgSSAIuOMVj0E4v8EOLukaRDDMzs2R8kKgz2QJVffbgLecZwuzeTeheSxqsy2EYSQ13Jg+JRhvel4bqDCwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=metafoo.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIR9oHHD023JSdyFHUvLum5NJrGYcwyHcz83+GjFAIk=;
 b=m1wC9hU3oPcGdTb8Xg+HCtKa1tFcKXtC0UWb5t9kJkHX0r+a5c96BWDUoingv/EF6kkfNYbTK2tWjUWzl5QC+jSALoFWKm+MfQjhP16s0mcGUfyZtzrzEySDiNYPvNyJMe9NNb+3OPkWNYt3RpzE3wBGYMDcfV9cE6KIvyNDC7A=
Received: from MW4P223CA0022.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::27)
 by SJ0PR12MB5456.namprd12.prod.outlook.com (2603:10b6:a03:3ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 07:32:55 +0000
Received: from CO1NAM11FT105.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::92) by MW4P223CA0022.outlook.office365.com
 (2603:10b6:303:80::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34 via Frontend
 Transport; Mon, 6 Feb 2023 07:32:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT105.mail.protection.outlook.com (10.13.175.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.34 via Frontend Transport; Mon, 6 Feb 2023 07:32:54 +0000
Received: from [10.254.241.50] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 6 Feb
 2023 01:32:44 -0600
Message-ID: <c6d60070-d4f4-05e4-fd13-a63e9d324f3b@amd.com>
Date:   Mon, 6 Feb 2023 08:32:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] dt-bindings: i2c: cadence: Document `cdns,fifo-depth`
 property
Content-Language: en-US
To:     Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang <wsa@kernel.org>
CC:     Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20230205230208.58355-1-lars@metafoo.de>
 <20230205230208.58355-2-lars@metafoo.de>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230205230208.58355-2-lars@metafoo.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT105:EE_|SJ0PR12MB5456:EE_
X-MS-Office365-Filtering-Correlation-Id: bb51acf6-703e-4c1a-48b5-08db08145ca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lShVS1AVH0relz5+ovhjoZMco9YCJooPjAm53UiQ+TWgNDTLfAhddkUa4psbLZ+RgWWO6XGi2nxUnNKGmjADhTLL1qjb4HCQy5qHFRCsjBdFjgeTYhpxMEIs8eV8Dbi2TeIv40JtzPCIP4ZQ97kKo5R7q/B57SdK/echZ4LWB1qN7QN4qkRLiKtLDho964It0hDm5D2KTJu7arlTd65qq4M+ABo0ClkXD8edCg/NBfDUyWjElG0RxM4WFuD0+Emt1Es/MSHcWcS5Mmn67F66vqpvqVqVMXJ6icb1L++cy7QallR6zUkoU091BGHFOi8TGogSqwx9ZgNcKMrHYc1MbhiLmlVzXKv8SmZzcYK8dHQ0pF8DdvzkxFTi9KqXKDo86yIVCqsDZg/FLWkOADVPjjeXpbitiLVxXebOR6VaVqPYVxBfC0DX3OkMKsuFKYwi2E5UyQ6FEAsT7BsZ3LbQxTefUq4WLHzOfWD7DL/rLpF/to3rJO7ISmyJXpjnv30syQtGtZOZ9aA44CDOpRzwpBtJOeHfWYWMzvhQyBlc6CnLjv6ohpKquCYmDlDiuF1D90//VzGvfXMYDLB6eowsngXCeZjzus/Z4TNWCUd5NvmOxby2a/VbnCaK6+FIXVFl3LdfzY7Ww64DuVb9JN07f08mIM9FcPIYEEEsL6RMvHvlOrP5Sdjfo3Vj53jPh8xNFzdhc2ob/SyHKSfWBByvT0ZcPicORxmNenbFiK0Hhkr4ceLrkm5DAfpakXpZlfzYisi40ZU9m6hkBSYUwHfPe1RZS4Cm7QQcb5rV0bJu/hQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199018)(46966006)(36840700001)(40470700004)(40460700003)(82740400003)(70586007)(70206006)(356005)(83380400001)(81166007)(5660300002)(8676002)(8936002)(41300700001)(478600001)(4326008)(44832011)(36860700001)(2906002)(53546011)(2616005)(16526019)(186003)(26005)(31696002)(86362001)(54906003)(16576012)(82310400005)(316002)(110136005)(336012)(426003)(47076005)(40480700001)(36756003)(31686004)(81973001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 07:32:54.8264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb51acf6-703e-4c1a-48b5-08db08145ca6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT105.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5456
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2/6/23 00:02, Lars-Peter Clausen wrote:
> The depth of the FIFO of the Cadence I2C controller IP is a synthesis
> configuration parameter. Different instances of the IP can have different
> values. For correct operation software needs to be aware of the size of the
> FIFO.
> 
> Add the documentation for the devicetree property that describes the FIFO
> depth of the IP core.
> 
> The default value of 16 is for backwards compatibility reasons with
> existing hardware descriptions where this property is not specified and
> software has assumed that the FIFO depth is 16.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---
>   Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> index 2e95cda7262a..3daa2fa73257 100644
> --- a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> +++ b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
> @@ -38,6 +38,12 @@ properties:
>       description: |
>         Input clock name.
>   
> +  cdns,fifo-depth:
> +    description:
> +      Size of the data FIFO in words.
> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    default: 16
> +
>   required:
>     - compatible
>     - reg
> @@ -57,4 +63,6 @@ examples:
>           clock-frequency = <400000>;
>           #address-cells = <1>;
>           #size-cells = <0>;
> +

nit: Remove this newline.

> +        cdns,fifo-depth = <8>;
>       };



This should be 1/2 before the patch which actually use it.

M

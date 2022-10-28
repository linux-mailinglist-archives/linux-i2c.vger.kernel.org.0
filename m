Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DDF061091C
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Oct 2022 05:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233619AbiJ1D7R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Oct 2022 23:59:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiJ1D7Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Oct 2022 23:59:16 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02DB2D8EF9;
        Thu, 27 Oct 2022 20:59:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1/gI77txMJLPkROI87IUmxSmbtC8Y01sqPV2sTbDxZgD3oSYL7w5k73DAWoknopYjNnwL7NWdsbDjqIzvtXMYdpr/L+p/yJkOfqqltPBsZtVQoQjL2xduXJ9ZiNJD/HRyw8EDrNtVbfFcguC2usYG5lbFACb2EhuSd5lmnD7HNcbTnRuRWrBJWkk+8iGvHJxU934+UkPZL1EZU2v6xJo8509/nA7pa49Y9xqn9vSl5+csFzd1DJAvqoOAvyQGIbIW88dFUsSaxq8FReRsw9DlhOro9N4FzhJ3GYwysQOaGrILEKGAAM8zY6H9oxhc9I1an/Fli6AOW7puQpi493Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CSm36fiStGfSgInpiL5KsSYhlJ4DILXnoqSzThhQ1Q=;
 b=QogPgitGJ+soTVSJgS6EfIGcADIxXKJnMd70Eq+3Y+pmTjIVavgHvCd7QfTTF0c2+naSdPcJx8uB8f4IAEGUJK6CbRN6nL2WXAh3LaPAKk/TDQRGIIf/fPb5aj+s6gyKVORTLn4dIqFRMzCH0hXqGKVl7zmmzjCjdC55gKGD9kWNT94BFPoxKP+rP7rA0NcYcm1wqSmKIovv5AjqKg3JuldyF8HOuJ3y9CHkcm6XRQx6d6Xbj8hJP3B4i2FQfw4Z/xgucHR/l66Z/9VJ/3fM893pih+dg4aj/CYTsn2L/J6234IBR3CafPxiVOHlXSXvsocHsgmM2JZbf8Lk6SjXxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CSm36fiStGfSgInpiL5KsSYhlJ4DILXnoqSzThhQ1Q=;
 b=yf/iOU0O+GvGm6h4mn//YuuQ/3MKlpiql3xMLtpxFfwuINyv9MIg01ZTz/EmCtNCF9bWEepn2yaKXBGErmnpHYqFbFqfmDz9O+6tIPLVZ0rG9zC9uSZ4Js9ikAc0HXkTRJq3t1cojh7/4pQU/Qt7Qc9wj77Z0aZiIdmP7YU3wig=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH2PR12MB4152.namprd12.prod.outlook.com (2603:10b6:610:a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 03:59:13 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::5ce0:abf9:fe08:f42e]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::5ce0:abf9:fe08:f42e%4]) with mapi id 15.20.5746.023; Fri, 28 Oct 2022
 03:59:12 +0000
Message-ID: <9b5a3d42-eb98-404a-50be-6112266c978c@amd.com>
Date:   Fri, 28 Oct 2022 09:28:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] i2c: amd-mp2: use msix/msi if the hardware supports
To:     Raju Rangoju <Raju.Rangoju@amd.com>, syniurge@gmail.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        rajesh1.kumar@amd.com,
        Basavaraj Natikar <basavaraj.natikar@amd.com>
References: <20221025181124.421628-1-Raju.Rangoju@amd.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20221025181124.421628-1-Raju.Rangoju@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::17) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH2PR12MB4152:EE_
X-MS-Office365-Filtering-Correlation-Id: b6a8a4c6-223f-4cb9-5629-08dab898c620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nYVNwJI7H4rSvKhMb7U+CpzvR/Ejt7LnpZLwum5nh2kk3B1Yi1Fl4gsOKMhPJ81z7siJ3+ahUU3M5n0Q2AimeUZCjJ9R+VBleuMvF2VfLgt+OPd5FCcXNsl7Wrr8qUIHUHknUZ7eF5mmyrFum1/Ho1Z2phe3paLEb/oIuyJbD4880ucOgPoF6CWqcUzjfY55TAXtNBcMcb58p1UQsm+N7tZp++bv3CJojobjW3cImpDEafE7ojVY3rt+t1eeh4A2G2xn6IxReRq0wnMajN+yc2kb/7AsyZZLmHhmXF2BFXZ3FAKvvEwIDJh6jAZz19oehxeYmvrrpe3l8whYzC02II87mTmJoYC6AfQYG16yYYHvnXGwtrviX9gRLBORIU1geqYhiEVVuzB70/JaykLDWVLHfEdbKa+vBRbvFshBwSIvuc8qh2RBga7HmTTUeKpXId11kId2CxMKLqQLlOcurQe7JPkhkvyMcIoLJ4ZqFReNmUB+MYYEq/mLZUObsPga5HoJgSznNS41xfPO1ny/MwJWbR5qdu3loRQQEhKRR79SOGFVNCIdtB5NUhbeuazDGF2HjUvRjIIj4ZSSZEceBASxazOmeut6e+LXDqbBxiegm0PMhDfPv4n8Blry+AWoPFu5BdH03Y7UTnF5PkSbMqBrE3G3aOcevOJbDLfFNQj8jUMUzRH/nJbUTHSCUMViVPfI7fDym30UltEiHX9PqShsmjEfXi4USd6ncE0Q+cQC6EPn7J4PSnf/2/3HUIrXBHqsiriM2cnql88bLy996xuBHcsfu+YsV+WyryqbRuM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(451199015)(83380400001)(66556008)(66946007)(66476007)(8676002)(4326008)(186003)(2616005)(316002)(41300700001)(2906002)(6486002)(6666004)(478600001)(38100700002)(8936002)(6512007)(31686004)(26005)(6506007)(53546011)(86362001)(36756003)(5660300002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUhWc0hYRG9hbkpXY1cwdUNLZEtkSXhHSXhTM1I3Y2xGSmxqamRuczl0WGFV?=
 =?utf-8?B?cUVqR2FqNUxwYUE0VEI0V0dPV2ZSSHZPUWprNVZyZUhVQ20xVEVHajhwRGlH?=
 =?utf-8?B?azVGaERwcnBEN1RyekZ5N3JRNy9MRjBjcUIvVFYzTlE2dTdvOEIyUGVhai8y?=
 =?utf-8?B?RmNNcHYvOVhhNzFFNzNScmRyZ2V6azI4UlZzT3RLaGQrV29wUGFzT1hMUUNP?=
 =?utf-8?B?eXZKWllMcWVYLzZLTFF3R05uMklvTDVuTHJHa1hCRGVRSG1VaVhwdWtVOUt0?=
 =?utf-8?B?OUpRRXdJWlVhd1hqVnhTWEVlSEZQNTdJM3N2M2QvOXJDQWJBUWVPWmJwVSty?=
 =?utf-8?B?Q20vK1Jmd2VTamFMZTE2dDRkMFBGS2x5VVJwaXF5eGNRSnRFUU01VlBmOTN3?=
 =?utf-8?B?NjJGOVl6VFJ4cFExODNiUytnSUVMWkk2TCttN2dLR3U3ajNCOVEwL0g5a3Vl?=
 =?utf-8?B?YmdiNXFUdEZKYUIrNWd4V0YyQ0w0dnBZNGxUZngxbTM3VTVzUlAyaS9LbXVD?=
 =?utf-8?B?NlR0S0t6cVRoSzN6LzVja2FIVTh3REpKTENjRURaZHJZa0ZJU3YxYk5jeFp6?=
 =?utf-8?B?RWxSazRJbnZYa1BtZG1GYVJUY2VDN1hkMjFJV3AvVUpWdjZvSmhvQ25mbmwz?=
 =?utf-8?B?YVFMb29UcFlmcmN2bERManlyVlVlM0lTRVFjdnpxWWFjUzBOWlRsOHRkUGFo?=
 =?utf-8?B?TmxKYnFwRHlQL2h5cTA3MlF0VCtnZkp6ZnNrR0tIOEpHVHZlMHpPZHo2c24w?=
 =?utf-8?B?Z0lhdC9tU1VYMnlMaWdkZ1ZkUkxoZitmM0thUG9LNUw2NlI3U2pwYmdmV2tF?=
 =?utf-8?B?bGZWN1JBTklES0VsOG5vRkltbGtkd1BZMDg3bllXMWxZVU5rRkpJQXYxdm5O?=
 =?utf-8?B?K0tDV2VNTGxMOEZFZ1N6WlZSVXRiYUxUa3dkOEU2VXRTZDIweVB0ZmtwRGdS?=
 =?utf-8?B?Rms3UmhUTjBxaHlTbEdIYXpQOGNpdFM4cEhJdkdlT1AzMThieE54MVBYQmla?=
 =?utf-8?B?T3dpZitXWCtNLzk4ZThFVlo1V0ljRjVXOUp4ZmgvN1RiT21NZzU5dkVPY3JK?=
 =?utf-8?B?anExVU42NlRtU1QwbStQU1FiVjBPM1RxdzNaVmNYQ0xQSkcrSmc1R2h2T1kw?=
 =?utf-8?B?VGo3T2dyQzJvdDBUaUN4b1VTcGovSkxjT01pYU5BYW9jUE5tOE41WUdJMk5C?=
 =?utf-8?B?UE5heCtWY0ZITkxvSVNaTEFSVlRYZWxsTEVCc3ZmWkFSS2tINTJpdnQxS1Mv?=
 =?utf-8?B?RFV0STlOZW90YnlxcDk2ODE3UmJnZXJlcW9YZGpHRmY0QnMweHhBdCtUTDFq?=
 =?utf-8?B?QzZBRmpNdnlHdjdOTWVXbzdEUHVlWHluVVF3UEt0elpLUmxHVmNObG4wWjlO?=
 =?utf-8?B?eExhQnhxOGRJUGZsaGtWM0xjeXVEL2JkSDFKUmd0ZkhVUGhjbkxoV0R4cTRG?=
 =?utf-8?B?bTRjOWRoNnI0NDJ1ampiTXU3SGtveGkwWEw2Y2ZYTzBXa2czaW10N25ydFQ2?=
 =?utf-8?B?dXpUV3BGcXlRSVRmSk9BMmxZZWJuQlN2TGZueFRGenMyUk5aZDM1aXNCcG80?=
 =?utf-8?B?ZjdMRHNWNHZFZUdCdlI0Q0oyZW5Xb1hjMFpseUFHL0ZyVUdMNFdYMHVadTls?=
 =?utf-8?B?aDBIZExub3hNMWg1UXZiRkM3Ym9hbmlIRkx0MUN3UThhdmQ1UWxMSmhrN1JU?=
 =?utf-8?B?WmxFTmZrWjJBNHZtVHdpRXRvNjgxUFNWaTE1dzhMWjlCeWVTMEFUWkxEK0lF?=
 =?utf-8?B?RWh5VG9jRTRVZlhodDB2OURoNEhzZENDeTJGRXdRSlk4OVdXNXJMVmJLbDEv?=
 =?utf-8?B?Ny96Wk9ONmhmRDZ0Z2pyM0ZOM1EzZFh3SktjQ1JnbllITE1saTRrcGtnbmt5?=
 =?utf-8?B?L1c4UGhPNDdEY1owOFpXL3BWZHE3cTFRMldmZjY5dGZ2amRybXNzZHRyU2xZ?=
 =?utf-8?B?TzVXcnJzV3JmR1diWE9hSjlieUR2VmxKdTEwR1pnUlcxaDVFMDJEaFhLOENS?=
 =?utf-8?B?QnllMFZNTnVEZFZYY2VMRUJTUDNiRmNKTGVJT3paTHJLQ3MwbkJSQ21jbWEx?=
 =?utf-8?B?ZnRoWVFqWkhNM214OHhXcFdPWmc1eDEySXV3ZUFUM0ZiU3hPUmtJK2pyRUVC?=
 =?utf-8?Q?yP1fPWZaxKIrgR0OFAwabBGZm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a8a4c6-223f-4cb9-5629-08dab898c620
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 03:59:12.8811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hrq15w7jRuR4Jt0dzEIRZo+k41OSv1pvzV5ivvtYxk+6uzbA1X57NMWUP5sKypggZL/6UuLqBJgwwHF0Bk+/iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4152
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 10/25/2022 11:41 PM, Raju Rangoju wrote:
> Use msix or msi interrupts if the hardware supports it. Else, fallback to
> legacy interrupts.
> 
> Fixes: 529766e0a011 ("i2c: Add drivers for the AMD PCIe MP2 I2C controller")
> Co-developed-by: Basavaraj Natikar <basavaraj.natikar@amd.com>
> Signed-off-by: Basavaraj Natikar <basavaraj.natikar@amd.com>
> Signed-off-by: Raju Rangoju <Raju.Rangoju@amd.com>

Looks good to me.

Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

> ---
>  drivers/i2c/busses/i2c-amd-mp2-pci.c | 30 +++++++++++++++++++---------
>  drivers/i2c/busses/i2c-amd-mp2.h     |  1 +
>  2 files changed, 22 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c b/drivers/i2c/busses/i2c-amd-mp2-pci.c
> index f57077a7448d..143165300949 100644
> --- a/drivers/i2c/busses/i2c-amd-mp2-pci.c
> +++ b/drivers/i2c/busses/i2c-amd-mp2-pci.c
> @@ -288,7 +288,7 @@ static void amd_mp2_clear_reg(struct amd_mp2_dev *privdata)
>  static int amd_mp2_pci_init(struct amd_mp2_dev *privdata,
>  			    struct pci_dev *pci_dev)
>  {
> -	int rc;
> +	int irq_flag = 0, rc;
>  
>  	pci_set_drvdata(pci_dev, privdata);
>  
> @@ -311,17 +311,29 @@ static int amd_mp2_pci_init(struct amd_mp2_dev *privdata,
>  	if (rc)
>  		goto err_dma_mask;
>  
> -	/* Set up intx irq */
> +	/* request and enable interrupt */
>  	writel(0, privdata->mmio + AMD_P2C_MSG_INTEN);
> -	pci_intx(pci_dev, 1);
> -	rc = devm_request_irq(&pci_dev->dev, pci_dev->irq, amd_mp2_irq_isr,
> -			      IRQF_SHARED, dev_name(&pci_dev->dev), privdata);
> -	if (rc)
> -		pci_err(pci_dev, "Failure requesting irq %i: %d\n",
> -			pci_dev->irq, rc);
> +	rc = pci_alloc_irq_vectors(pci_dev, 1, 1, PCI_IRQ_ALL_TYPES);
> +	if (rc < 0) {
> +		dev_err(&pci_dev->dev, "Failed to allocate single IRQ err=%d\n", rc);
> +		goto err_dma_mask;
> +	}
> +
> +	privdata->dev_irq = pci_irq_vector(pci_dev, 0);
> +	if (!pci_dev->msix_enabled && !pci_dev->msi_enabled)
> +		irq_flag = IRQF_SHARED;
> +
> +	rc = devm_request_irq(&pci_dev->dev, privdata->dev_irq,
> +			      amd_mp2_irq_isr, irq_flag, dev_name(&pci_dev->dev), privdata);
> +	if (rc) {
> +		pci_err(pci_dev, "Failure requesting irq %i: %d\n", privdata->dev_irq, rc);
> +		goto free_irq_vectors;
> +	}
>  
>  	return rc;
>  
> +free_irq_vectors:
> +	free_irq(privdata->dev_irq, privdata);
>  err_dma_mask:
>  	pci_clear_master(pci_dev);
>  err_pci_enable:
> @@ -364,7 +376,7 @@ static void amd_mp2_pci_remove(struct pci_dev *pci_dev)
>  	pm_runtime_forbid(&pci_dev->dev);
>  	pm_runtime_get_noresume(&pci_dev->dev);
>  
> -	pci_intx(pci_dev, 0);
> +	free_irq(privdata->dev_irq, privdata);
>  	pci_clear_master(pci_dev);
>  
>  	amd_mp2_clear_reg(privdata);
> diff --git a/drivers/i2c/busses/i2c-amd-mp2.h b/drivers/i2c/busses/i2c-amd-mp2.h
> index ddecd0c88656..018a42de8b1e 100644
> --- a/drivers/i2c/busses/i2c-amd-mp2.h
> +++ b/drivers/i2c/busses/i2c-amd-mp2.h
> @@ -183,6 +183,7 @@ struct amd_mp2_dev {
>  	struct mutex c2p_lock;
>  	u8 c2p_lock_busid;
>  	unsigned int probed;
> +	int dev_irq;
>  };
>  
>  /* PCIe communication driver */
> 

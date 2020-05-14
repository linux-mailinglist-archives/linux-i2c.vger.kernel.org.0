Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 819FB1D3007
	for <lists+linux-i2c@lfdr.de>; Thu, 14 May 2020 14:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgENMlZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 May 2020 08:41:25 -0400
Received: from mail-db8eur05on2119.outbound.protection.outlook.com ([40.107.20.119]:4961
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725955AbgENMlY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 14 May 2020 08:41:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GjuitEr/D3khqfMHQusfZ39/nvH2F60lBzfeG/e0D5TEDOoJJNiyD26Q2ypBQKR62ilsaykiCHAubzlQ+tEvgHDFKhXS4ZvObYtTCioOkPMii0tXih3giST6zAF6J14tcmcvnMRz19H6sMzxAZZYTJLOLk3AkZnyTDDEwLQTRHevvbA20axpCvqubiAgG4LHQKwHv+SwbPZ3AO1y0C0H0MWlpXjuPwh2A93G+MlY/+RdIL3XRjbEPfvAMcrcN8z20YbRXGxiLgluawSzp9GZ7iraEFEiSmxC/3GB2izhV/VWLtLHxnigEDVFL0pFgrKpF6t0ZeExhMBVluFyvOjeDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jCe8Y0NavFlwmYDyB9V6nTr/+qHPaRZq2Gm1bDippY=;
 b=NW/tedHOaIT66xV9MvuUDuCB97QhrhmPqH1KIz6+tHeLQ0h1YEv+CxY8zXdQhzX8RAvgslQ6E4+bNWsO/zVDPIZ/W7krRgbs3G7pD/cmmm7P82cLAQsUV5JiOrKkaRYBR82A0Rb7K5qEtqNhXEDxJJyBjTxO81SW1Cp5vuYAju83mahZBfSDllnfV6Y9htNBjlR/S8sIYow1RESapizZufBMg7Z/axdKpivr/Fl1PqtnrSd24Z4wIUTPLlsdpG3muqEXnMIAgtNSxNVJNzGjm7BjMQYmDT5RmQ04SV6oQr/fnJNuqTxiOHGNGyyh6I6pOBbqoo9yGs48Be31XvSm+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jCe8Y0NavFlwmYDyB9V6nTr/+qHPaRZq2Gm1bDippY=;
 b=fE7GL7oghbHxsIRoSHs6/iSjvvD2sMfcJZTQDUak8d57wrgWBrkpFntEPNfkJwlee/SQYtYHKn0O62zFalsvA0xrCUKgTNqFXefsAXBNMdPXIryOzJ2YLHAkwO5o815T+s2ufHRyeEjCcWxqOBD1eidSwIWn7YiDa6JwVtoEfo4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nokia.com;
Received: from AM6PR07MB5957.eurprd07.prod.outlook.com (2603:10a6:20b:90::18)
 by AM6PR07MB5089.eurprd07.prod.outlook.com (2603:10a6:20b:5c::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.14; Thu, 14 May
 2020 12:41:21 +0000
Received: from AM6PR07MB5957.eurprd07.prod.outlook.com
 ([fe80::74f8:a2fd:d0df:8ecc]) by AM6PR07MB5957.eurprd07.prod.outlook.com
 ([fe80::74f8:a2fd:d0df:8ecc%2]) with mapi id 15.20.3000.016; Thu, 14 May 2020
 12:41:21 +0000
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   =?UTF-8?Q?Adamski=2c_Krzysztof_=28Nokia_-_PL/Wroc=c5=82aw=29?= 
        <krzysztof.adamski@nokia.com>
Subject: Two separate i2c transfers
Message-ID: <5a17ba7b-b1a5-234d-1cae-4e77132bd15d@nokia.com>
Date:   Thu, 14 May 2020 14:41:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR05CA0152.eurprd05.prod.outlook.com
 (2603:10a6:7:28::39) To AM6PR07MB5957.eurprd07.prod.outlook.com
 (2603:10a6:20b:90::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (131.228.2.7) by HE1PR05CA0152.eurprd05.prod.outlook.com (2603:10a6:7:28::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25 via Frontend Transport; Thu, 14 May 2020 12:41:20 +0000
X-Originating-IP: [131.228.2.7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 70bc8b36-1dfb-45c6-2a02-08d7f8041adc
X-MS-TrafficTypeDiagnostic: AM6PR07MB5089:
X-Microsoft-Antispam-PRVS: <AM6PR07MB508977CBFB617F62C877FD2DEFBC0@AM6PR07MB5089.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 040359335D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pJeEyWBxaNAMHvJ/rvYPOZYZVeT88ijGTl4/+QMmRL33XuCh+hmcL1XgsQLa9ml1u2LI/WhyCDk94LIa0hOe6fYXlNTIRuZyn9AbzPq5dHBQkq5fBjB6NRZQl8mIDeGhABu9QL//ngc81qmLi+hxeyHNVdtZzhFG91lv9Uz/+AbsMSatzLYBcd4XrU9ZWXYmxqSe0ckm60nPFA/5bz2bIdluddjmpOy6HDHxpr5ibCUBDFzxMB8jjMNS26cysAHEuXHSq5H6cTz1Tj1AYJ52R/8H/7pSta0PqUUbvFDhVcFVVgHhhB0JRQ0TY/BndhYL1FnQZSoZ4sfPLdj9aUqCMWPBdWX9SK4CtEsGwwa8eBCOzReWM9Sq3O/ZDCeyc36MP3XXnuCIlpeEhewmlI6XU0+687wDOdGNi+Wn+ipqOlOqfFirwx255GJ7tamlhoNvYPWiIbh4lspUJyR78i5BmVFiPxkKj+SgahJ9UmoZ2cWeWXKd8n+IXTUxQptuGHyW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR07MB5957.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(31696002)(66556008)(316002)(956004)(66476007)(2616005)(6916009)(5660300002)(66946007)(6506007)(6512007)(16526019)(6486002)(8676002)(52116002)(186003)(36756003)(478600001)(8936002)(86362001)(31686004)(2906002)(26005)(6666004)(4326008)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: h2ZLAT33xeqjvTl9CTNNwXKj3+Z0kjZoNf9u0V3/nt8owQS07w48YG2QMtV2mCj+J/9WzP+fc+JJ2J1IM7AuXRy5w/edx+Mv39Yvekpp1d+4QF+FvATy3b9+rRNK8+rLVYPjbiTG+YObLc7voi0yANhsXxZB6AXbjHDRQ2sRnftzVtuo9EUko8ujSG/NS2s6qkspNqMU0Xdysp7D3rfXPZdyUjJ43t0dGPMH2vXRd3crWgBiEH94vQwEz8g2QsLno3BI3kd9AGiSV13wvUAKDfrEw5Q25mkIIJc5s4zyghjuyvM9AmfQWCAlCVXHUgw5Jgay2lPdOGskClBai1L41nA9TRfiHbwCM/xGU7p7Qwc4VyRw+99chO9BzvA4NE3ukaVubRllxVeJfLLV3qCYdnjQuns597s6WBEQYnrfFNEkOQKsBuM6XJyIPXgECGymg7sEVzHjnhhRUnWHlnVBMjridWTf+B/lC50zXOVFqBg=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70bc8b36-1dfb-45c6-2a02-08d7f8041adc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2020 12:41:21.2207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5qvKEslc4loVbMxG1gZC4Pb347bY9tsLvu25IuqT/+Wlqudl1yQd/rxGRlo0crhOsNcoRhqIm0e9m1qJyOSKSlMz5Q7i+YqAm5quCY+jVpo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR07MB5089
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

I have a problem that I think cannot be currently easily addressed by I2C framework in the kernel and I'm seeking for an
advice on how to approach this. I have an I2C device that can be accessed from two I2C masters connected to I2C bus
master selector channels. Both masters must do such a sequence before performing long operation:

1. Read status register.
2. If busy flag is not set - write to a register to start operation (this sets busy flag), otherwise exit.

but we cannot call "start operation" if busy flag is already set.

We can solve this problem by keeping our channel selected by BMS between operation 1 and 2 but that is not possible via
i2c framework right now as i2c_mux_master_xfer() will always do select(); i2c_transfer(); deselect() and we need to do
two separate calls to i2c_transfer() (as we have to skip the 2nd one if busy flag is returned by the first one).

There is no way to pass flags to the I2C transfer currently, we can only pass flags to individual messages. A dirty
solution would be to introduce a flag like I2C_M_NO_DESELECT that would be checked in the first (or last) message passed
to i2c_mux_master_xfer() (it would be ignored by normal i2c adapters) before calling deselect(). I'm afraid, however,
that we might need something similar for select as I imagine some i2c muxes might return NAK if you try to select some
channel while other is already selected. But maybe there is some better way of handling that you could suggest?

I imagine this is not a really common scenario but also think we might not be the only ones with such a need technically
this is achievable - the only problem is we cannot express this in current code.

Best regards,
Krzysztof Adamski

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1580347814E
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 01:31:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbhLQAbP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Dec 2021 19:31:15 -0500
Received: from mail-dm6nam11on2071.outbound.protection.outlook.com ([40.107.223.71]:21184
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229563AbhLQAbO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 Dec 2021 19:31:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGeuALE5GWefOjCTn6GCdAasQgWrW7mNeVU9ZhKCBVpKOIOqbI763LM6HlBRSZE/DB9FK0JQIsIbJyTef4irZWWGD7QP7FFOZ8oT+AooQoGzytvoYZW2iOWWP9Qa/x4IaEXzLhjfsiVW0yk9XrJ9YroCIfQFywiSkx1/N7ugN9pryk9AAoigY1X6wcao33uj71cx39gnbFCerjPWIPcWSPZCmjaf+fxUhQlf4eQ6xkNZXfrFreaOq0KPFE9tqZHQcVE3fux26wHqDwEFD3vuybzM7Xlz87AO5ldnVoCNSo2BLuuqLAIvX+EOXk/+JfMt65mHvkjLfE3wplC8OnOJIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0zZ9EILlwXRRTMMoj1qshsOJ23uYkdy2Sdjob72elg=;
 b=XlsypshcToEXZHT8Fm7z3skCnwSBOctRY+2WLR2uvx9dYImqbi+l3GJlpcfyYgCWAomKiznQIjcSrHzXrlRewSXQRcjubDfeCWuAxnNFmfCKZ7TK1sXmmACJz0M7mrVhMno1UFyIbP9+ue/gNJIjRb2DjePe5/4tVovZUF+zvhfsatnNXXdQI5GPBH0VDF6L+wY8G5RfSFe0wWfJpQiUGln8IW1SH5N7bUVzYIXg5jKhZKsVxbUmSRYALxQ+ENouHnKD+aWOOl0b8LKCXi9uCoRBq6KOABmG/pUlmQaLx06zZuNLuuAzP5VSXMIvHWLzinyp9C+Zu9rwkXciyrZN2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vpitech.com; dmarc=pass action=none header.from=vpitech.com;
 dkim=pass header.d=vpitech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vpitech.onmicrosoft.com; s=selector2-vpitech-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0zZ9EILlwXRRTMMoj1qshsOJ23uYkdy2Sdjob72elg=;
 b=nkKKOA5sYEXwdwZNSGtw8HyQI4v/nvhK/94TyaSe6U5FY0OWHbPowV0HPoAVaFfKngx6MFS9GHIFTlHD6EEOanclNpgKDxt+tOwtYfaIu411CshlZwkUetCgitlV+z5fDLLHy60j6r6h0EJF8KY5sv3XAdbJcZDVB2KQNGLj9oU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vpitech.com;
Received: from MW2PR07MB3980.namprd07.prod.outlook.com (2603:10b6:907:a::32)
 by MWHPR07MB2768.namprd07.prod.outlook.com (2603:10b6:300:28::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Fri, 17 Dec
 2021 00:31:12 +0000
Received: from MW2PR07MB3980.namprd07.prod.outlook.com
 ([fe80::b999:3294:6433:4b13]) by MW2PR07MB3980.namprd07.prod.outlook.com
 ([fe80::b999:3294:6433:4b13%4]) with mapi id 15.20.4778.018; Fri, 17 Dec 2021
 00:31:12 +0000
Date:   Thu, 16 Dec 2021 17:31:10 -0700
From:   Alex Henrie <alexh@vpitech.com>
To:     linux-i2c@vger.kernel.org, marcan@marcan.st, wsa@kernel.org,
        jdelvare@suse.de
Cc:     alexhenrie24@gmail.com
Subject: Re: [PATCH v3] i2c: i801: Safely share SMBus with BIOS/ACPI
Message-Id: <20211216173110.82ae177385322c0992d00126@vpitech.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR10CA0058.namprd10.prod.outlook.com
 (2603:10b6:300:2c::20) To MW2PR07MB3980.namprd07.prod.outlook.com
 (2603:10b6:907:a::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4192c76c-a1f1-4d1d-9e59-08d9c0f486fb
X-MS-TrafficTypeDiagnostic: MWHPR07MB2768:EE_
X-Microsoft-Antispam-PRVS: <MWHPR07MB27680A859579A06CA7496B7FB8789@MWHPR07MB2768.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C0xryJmQ2hOKpu0NxlIplJmdVL8auThKppoj3l7h8/e7PPapZOswPt2sB6rryiE/Xyymtaav67SRpvYKgiCOn10j7aitlCLU0DwrW6sDCle5/eiTVPeS8KsoYjcE4iCZBdz9P2fm8X0HvTKRdWG92ho7PLMLO6x6KCql3En1zobMFVb2pYGSaiM6PVt3xJIqyvcq0b5/0H7tfnZhYnILK/fjoh1IRzva/gYt73FHypwXs7OFnFaAdZCEDX/DpO+6Y2m4LHQz2Uv9Znbf3IUdWZsKk3V5GhP+8Dlgqdi++pW8EzItJBy0W+xKhHewEP3mybld1JsnUbWkMJSddTtNE0BxkkUF06z5G2/Dff2wqIgo587VY6JG2tzITJvk3GwZG0x0+0AAWE2uk348bKPmFj0gjWNAwilXBa+ME7Ih1jh0Um4nBz0/QauBiFU6UQcEYyM9+94pirioIoJDqU1I1TBQlkZeMLsvrsU4cocZG1Mip1tPOEqJzHyix4JNXfvuYCFsdAy3jDzxgBa6kkDhOeXEztYEBmS+Dw558qy+TDO+z1rFwSr5YohRZ14Zr6zMVNsyeHBsV7BY+VwVaW9wQzzkj8QVE6rXbviYlFd73DnfJVz7Fx1CfBydFDXp5oaFCql1azVR7oo5H2T0QPY9Gal40m11yfTT/j8RS6ZAdhIjwppPHU6O/rq2WPy28f6B7ejX8F2HQ+um6GvoRzRhoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR07MB3980.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(39840400004)(346002)(136003)(396003)(26005)(2906002)(316002)(83380400001)(6486002)(86362001)(8676002)(36756003)(6506007)(1076003)(66946007)(52116002)(66556008)(6512007)(66476007)(8936002)(38350700002)(4744005)(38100700002)(186003)(2616005)(508600001)(4326008)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NfSesjro5RwlfalzfUGi0jiqYPlmKYVRMZB1Shgh9O9B5UkDc9EWPB0loT/L?=
 =?us-ascii?Q?Jt8Ku7h6QNnRWHVu4Jzvc2R3UsO5MuGpiu3G/bbogGjG4VZsF9WSwGQv2HE3?=
 =?us-ascii?Q?TEsEE5mbKnA5Xntl5uRihJvnE/h2PQscnOL4CuYeCdoYRf5Jf6Q/iyWS7+tx?=
 =?us-ascii?Q?YhEKzhOGLFAAAioagSc8Dr6Ky1BIvVkpqnOHGJ00l/95wPSV8GjafefCdh00?=
 =?us-ascii?Q?Xdrfnh0pl/Inz0idpQJo9hPWokiwJxFq3ydzmj+J1D27M8bGkyg2q9y3N4Ng?=
 =?us-ascii?Q?xxLPZAtLGXslGsy4LL5A9Mmx2SmkIeA5i5dGDnwEBLwgJUCxRY1QjULZ39Lb?=
 =?us-ascii?Q?MDMarUS9jyOmihXKlkbODb91h8V0/Zhd5PMbtcMMB8zlVTKY8PGTBfJheRIz?=
 =?us-ascii?Q?U7g9naAny8tNUyeYRegmbUiL5SsxPe1+64Xy/2qTiGT29uQS3GZZ2PAOCW/8?=
 =?us-ascii?Q?2GeFIT24nMkTcQLuSzc4CF3vQ32OpXJrfu818uI2yKDvI/R8kkzZd2Z/gq++?=
 =?us-ascii?Q?FT2mlvmjV5OMfOpDS79mODAlKaay44SOQt0T3yOtFzKkSTkVpvYZuIOBywBe?=
 =?us-ascii?Q?BLqD0k2Um8PgdUiDbHJ1H2z1jLM1a2kefpXARFESN3xIYT7VUGJTxp4/BWQx?=
 =?us-ascii?Q?iiUVN4/qOsYHKx+FcTFFqLjwNhxziNSRiFpDxNMz4HB6jVk1MbmwwrAJmLep?=
 =?us-ascii?Q?lJEoklpO4d8a+Doj9rjUpackpJNlrtJjHvtRjEm/rWarPOBn7h6F5loLLtjD?=
 =?us-ascii?Q?WHCArQI66gZqzolNNb3n18ppxpWUw5EJnsVWnGpoo8EKcvLReyVOVTPdxM15?=
 =?us-ascii?Q?zNKhdIiX2+zKWsU/Lb8Zpo2aM6yUD5/woLAgvFc3NUmxyVAO5bmQpl+d3AUl?=
 =?us-ascii?Q?iuv/642LieEGIegWrpkJrg6fBzxrG4RuXW/HioX+QW5e8Gy7b129mZlO+wxs?=
 =?us-ascii?Q?tImbZZjK1ZVU0Dw0s6bimtGG3AUD17dFpSiA7ZaVoEweCWsnxP5XUJXe5jB0?=
 =?us-ascii?Q?eV4qQvtWg4wyaenOzPf2GX1DN9bgB5/kJm3nywOdS8ClLK+ySVbfPhyY99d2?=
 =?us-ascii?Q?rUgMa8+qZExNnHtKMbONSQExzGO0deyctj85/T1BOeMGrjsKyw3cdOna7+zg?=
 =?us-ascii?Q?EDj2lU4spUzygNAYmUBChXgcIsP08GqcOlL/g3xzL0L5l8aTLp+UR8mmyGpo?=
 =?us-ascii?Q?N1ydjyZmoqvwZFxrCnSdzu9ijQowKdbwO3Ohv9+3nAva1osk1WZXpEz6YyRS?=
 =?us-ascii?Q?sei8YlSbcpRhSP4VZaAXrBuKMhVVVFdZRv0Z44U5Gx180AEz591YzCxhtKk5?=
 =?us-ascii?Q?bqmMP/Tc/mvDCCg5EC9mafVW9VJKI50EueKpjvv5laAYdBGhqqQMx++vhs8L?=
 =?us-ascii?Q?fh62Ik1gZHxFjGeXs9j/teNya3naEH8o9sia8qSmoAQwzdxMhaXLkgEB9rvA?=
 =?us-ascii?Q?pZgdM0dLwR229kfIqh6p6pVYyNifX5wSYn+/Onr1LEMUImrju2/2ljdP7YxN?=
 =?us-ascii?Q?ySvxRZzT5POEz4xTE3E1Y2lofIVU4IKcDotLP4HiHqrT9tEdWENVfaqONj01?=
 =?us-ascii?Q?U5X/2L916wBl0U5hDlwOv/FMj/GBZDZ4qcsx5SGaH4qswRJhIDwwhO9ynkMN?=
 =?us-ascii?Q?e1oHshjciUNNFH8XUNs1TiU=3D?=
X-OriginatorOrg: vpitech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4192c76c-a1f1-4d1d-9e59-08d9c0f486fb
X-MS-Exchange-CrossTenant-AuthSource: MW2PR07MB3980.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 00:31:12.1950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 130d6264-38b7-4474-a9bf-511ff1224fac
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: miSnXTC4NY2zp3DAmJ3FCX21iYRDYqbyzXHe+AMWQzUt11NeJwMzCPTVzTTSF+6zZPW9NzP73fiMLAmyfxk64w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR07MB2768
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dear kernel developers,

I am having a similar problem, but unfortunately this patch doesn't
work for me (I get the error "BIOS uses SMBus unsafely"). Would it be
acceptable to add a module parameter to allow access to the SMBus, even
if the BIOS is using it? I realize that this is not a good idea in
general, but I believe it is safe in my particular case, and I don't
see any other way to solve my problem.

-Alex

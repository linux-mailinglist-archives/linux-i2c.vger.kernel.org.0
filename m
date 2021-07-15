Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF733CAF10
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jul 2021 00:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231673AbhGOWVj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Jul 2021 18:21:39 -0400
Received: from mail-mw2nam10on2071.outbound.protection.outlook.com ([40.107.94.71]:17420
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231547AbhGOWVi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 15 Jul 2021 18:21:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2LXshjazLMo3IiGiYXb4sM4r5RsfVI58Yp0vN6eTPx/A1dWD9HcgY1ALOumGQqbY/cEyKFeDy2MMK6CxxvSOIzqopJKeQD8PLk6zBC0Veh9iGhtSYxbaqGZaoo751TdJGu81RjnjhdCaAgKEsQcPsYdhzV68/KwXXVP0alskYRBt9K0Xw+TUPU5h4AJFnMakUmsDVWXcSPv7ZOQv8QK756w3Y9TxLk7dHK/bLkkXjhQYQHAGF1ONJICXdoLqkZhw85cE4nenvkLSLaY0t2EsEXQl1qbRklKVVUC+aXOpRns2OHCvwAPeO3tz2tjRFV8k2SGiPFoK5RA3CYFju7BEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pETM6i1W3HLKIhLJNT3XBIxD0DSUjT2YbRSp5JNDAwU=;
 b=n2i45aBsQcWhIZx83lvRpx6hPtl0LUyrK6UEJBmfuS+6zKom/xGgonYfh6aLoyGjXSaj6gYNDU4MpMueb7b6kv21BjNVe++0jGHIkOg587bHfxAYbbCcKtTJT2TIaZCQP0bIxOn7pg0Jk7B8CSx84RpUHzZfcrrcRd0I5arvbpcVsbmYp9kNFDTCPmLe5grIaZAXbYgBouj4LTg4s1XTp8FzEfE2FlF/h/74KwHGzEB87GUusJghAS8zfW2dxWIzTsdkF+pLn/aNMsPeLG2zQFda2vmARZimbIH0pFb3JpFNudAQGdNaws7lJhvqiNLi54f40movahshCU04uGMjhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pETM6i1W3HLKIhLJNT3XBIxD0DSUjT2YbRSp5JNDAwU=;
 b=b/1ynUwvDI9rJyvML9msAXW8p4jRMlrkOeJtyp75Wa5clkl36OZbR9OkcDhbucVGs6Spqa2B1/lzHSYFr2v+bARqFBeLExeELLIdmnwIjTHU1TU1V5d0q/Bby1AxgQvu4feP6JN+PvOTFc+JNJiGV/7k26s5JTzA6u07OPb0Ig8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4512.namprd12.prod.outlook.com (2603:10b6:806:71::9)
 by SA0PR12MB4384.namprd12.prod.outlook.com (2603:10b6:806:9f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 15 Jul
 2021 22:18:43 +0000
Received: from SA0PR12MB4512.namprd12.prod.outlook.com
 ([fe80::e0d3:ee92:593d:7844]) by SA0PR12MB4512.namprd12.prod.outlook.com
 ([fe80::e0d3:ee92:593d:7844%7]) with mapi id 15.20.4308.027; Thu, 15 Jul 2021
 22:18:43 +0000
From:   Terry Bowman <Terry.Bowman@amd.com>
To:     linux-kernel@vger.kernel.org
Cc:     jdelvare@suse.com, thomas.lendacky@amd.com,
        linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: piix4: Replace piix4_smbus driver's cd6h/cd7h port io accesses with mmio accesses
Date:   Thu, 15 Jul 2021 17:18:28 -0500
Message-Id: <20210715221828.244536-1-Terry.Bowman@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0107.namprd02.prod.outlook.com
 (2603:10b6:208:51::48) To SA0PR12MB4512.namprd12.prod.outlook.com
 (2603:10b6:806:71::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ethanolxb27ehost.amd.com (165.204.184.1) by BL0PR02CA0107.namprd02.prod.outlook.com (2603:10b6:208:51::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24 via Frontend Transport; Thu, 15 Jul 2021 22:18:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e4ca28c-f54e-4cbf-c694-08d947de8162
X-MS-TrafficTypeDiagnostic: SA0PR12MB4384:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4384C8B6E21E8426CC8346B883129@SA0PR12MB4384.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e9x5nFDb+UN4SA/Szd3IOBLGJx7EmP7teQnGVxY1BNYt7qhBdk4CMzpn1o7EZG6yEUfCVmQIGAPciYdv4QkPaiiHErQtNE6R1RpRGUbD6FjHcEy/MSjslf5Vj9ULuJ8PjJK1Jkrhq3WSC3VdvRsn24uaaC5GdCBGJCvKPphU6wBSnoBjMW1OJQ6b0LiXG1Y5bIhFj4oprH9ogwJJ9ksY1/JnTTzEBfl0FVjGjcTxfUMxFF2YFvPh1sMR9N5VfN+KzJj9/LXxh3W91mGvh7hBmxuL72lgvFjBhEe0cYDHjOCPIR3Qz8URIdgJv8Cv+YRfvAkRLeVbD3003RB+uQPBYC+X579RTzjY2iuJGSaeRA1WYum0ba9/E6QFJ4y3mHZf6FCrxD0S9x+UVi7pVvHl8ImXfzwOWwsmtNCLdshzyotLVOOWqEF4o87hZ8eoDKXjqWdXfp66/WtYrPRFLCa9FO3lwCKH9tKA5rvEp6Yf4Ice65fVyyS//8MWG6YZilB0As3a0/YM1iGXORS4CQz1OYJy738TXKenud3JH7Mr4VKhGW2N/36ur82niZ/Z7BGQDMoh+Jh1eGk52niz3xcukYc36EgH3RVBSnxgQNzSKVM7oYDi+1/UaUUDMrWe7JjygcCSdtHeLqaujgmxayZSsHZJW5JmFABNrzK569snVi3aSSqtWkyR7q+gmsxdwSLC2iv4Z7F8KLGJlWnzufyfEKk6sqH7YxL3av1thleyibM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4512.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(7696005)(8676002)(316002)(26005)(1076003)(6916009)(36756003)(6486002)(66946007)(66476007)(66556008)(52116002)(956004)(6666004)(5660300002)(186003)(83380400001)(38350700002)(2616005)(38100700002)(2906002)(478600001)(86362001)(8936002)(4326008)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vvh3msYUnxLX2NbLxD/L5ZiQd/yyLOzlOONiQau+1BsKbDauGJJXcucTqv5i?=
 =?us-ascii?Q?H5HuzQNLIt6aMbunWYt0l3Ytm+bevCp2PQMeo98scapevaRfaC42J2q4/lt/?=
 =?us-ascii?Q?fIZoMUVxXLez2hlYpcxG+Z3krgpyXl1CjT/X8ogyUIN+6ypRo1cLBGVvMj/k?=
 =?us-ascii?Q?Rh/hma50b8vpSRprszEJzdNfuKSgXLL0KmzZpgHwjtqTdrGnIVNLlKLWqaTe?=
 =?us-ascii?Q?McAty8GWd9NSmpfb+vZn+YedIKoqbaSvdM/mftsCKU4YWV5lYY7YUi5oTlBr?=
 =?us-ascii?Q?z/P/1qfy8Bs742g/7u0TuhG46+uf/fYIf8hDeImRgGaZBmawi+a+NbQyNk7r?=
 =?us-ascii?Q?vpERXExyMDLpxg2G+FXWOCxiDZGAG6821nUhM4FfX54R0udxx47+StoEMx1G?=
 =?us-ascii?Q?d3PQma1m6GMYZSJtMOiCS1I0zsDMlXRkLdJ+fRL3gmOnedXszNMHYMAUgw+q?=
 =?us-ascii?Q?OvI8m0fhVUefDqE7wn5dU757crvtDJJ184nUAZASJCDajmh53OiGjDioMw5m?=
 =?us-ascii?Q?rFgJEgNWT4/EXNdS3s1Ynnm/RpL+dEhouIdT/tjXfFuvVPuJubaDZtXs/Mf3?=
 =?us-ascii?Q?Lg6lMLnZmp8V6Wd7DMiPdKtXhPUMPuAw+2bk+tjcDWENVCxn5jj4FgSbvYkB?=
 =?us-ascii?Q?A9yGbCQt2yLh8ZCnxWLGL3CR43b9zX1BChALA/Mj5M2Z1m6adlBfDzjWAnB9?=
 =?us-ascii?Q?DJlMb0xq64cuO2IkpIiz7yx2PEPkQBWh5GaXVvFHU11qcBwbt8fEay+eG3Ek?=
 =?us-ascii?Q?JLcSracqkSWB/4jjE/pwPB1GxlBz6RW/mzrik+SwpmiyHxUOyrXHkq2NRsar?=
 =?us-ascii?Q?pFluop7ySfnJm41fJJZu8QBnsrVXClQhck1iEJI11m6YWvazooaJRTr+YtFd?=
 =?us-ascii?Q?zyfvst89pnDuXaGdG+rsk0XyNzrknrfRy/9t0ta1laIoJ7OCIEcoT3cfPnGl?=
 =?us-ascii?Q?AJtbOBL0DTEDfF6btzNBdocq+3bXBKNMIdUVVbWBoDkT9lnBUd+HLFhZoGnA?=
 =?us-ascii?Q?+vhdIbvib+458wjeu4VAAkEqWrrfthBMSjcQniRrondI5JfuAsfhWkKXyr3O?=
 =?us-ascii?Q?WX6J8jGidXpf++JS6lqLfL7HQA/8dTCqOpJNNFx9ywpbeOkX1v38j7yFEVI3?=
 =?us-ascii?Q?H9FXGo48LCOa90Aq7DcPV1GPn6tfZA++DXzM8yr4d6dI5DqkiXNbwmo7Wq3D?=
 =?us-ascii?Q?TF1kUXUCQY3b72t0XtOjsiyS34lxd2/eMqJyzBNycXuOV8B7ZiLqIag62fkB?=
 =?us-ascii?Q?d+T/M2bnSe3a6sl4uhxL7img4sBjXTus1bCiwIMc2UXbdBeYgo5Mcbg0+Bmh?=
 =?us-ascii?Q?KOdgY/Xjb89SJ9Pkq4S94UYh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4ca28c-f54e-4cbf-c694-08d947de8162
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4512.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 22:18:43.0404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BYt9ieHmlyvvUqmHP09ThmVBS+UfScBA7PT2vE18kIQNRY/kuLt/n0Bx/gk91taapyHefiQY7iaX/BYcKXbjkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4384
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

cd6h/cd7h port io can be disabled on recent AMD hardware. Read accesses to
disabled cd6h/cd7h will return F's and written data is dropped. The
recommended workaround to handle disabled cd6h/cd7h port io is replacing
with MMIO accesses. Support for MMIO has been available as an alternative
cd6h/cd7h access method since at least smbus controller with PCI revision
0x59. The piix4_smbus driver uses cd6h/cd7h port io in the following 2
cases and requires updating to use MMIO:

1. The FCH::PM::DECODEEN[smbusasfiobase] and FCH::PM::DECODEEN[0..7]
   register fields are used to discover the smbus port io address.
2. During access requests the piix4_smbus driver enables the requested port
   if it is not already enabled. The downstream port is enabled through the
   FCH::PM::DECODEEN[smbus0sel] register.

Signed-off-by: Terry Bowman <Terry.Bowman@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Thomas Lendacky <Thomas.Lendacky@amd.com>
Cc: linux-i2c@vger.kernel.org
---
diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 8c1b31ed0c42..2d2105793944 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -77,6 +77,7 @@
 
 /* SB800 constants */
 #define SB800_PIIX4_SMB_IDX		0xcd6
+#define SB800_PIIX4_SMB_MAP_SIZE	2
 
 #define KERNCZ_IMC_IDX			0x3e
 #define KERNCZ_IMC_DATA			0x3f
@@ -97,6 +98,12 @@
 #define SB800_PIIX4_PORT_IDX_MASK_KERNCZ	0x18
 #define SB800_PIIX4_PORT_IDX_SHIFT_KERNCZ	3
 
+#define SB800_PIIX4_FCH_PM_DECODEEN_MMIO_EN     BIT(1)
+#define SB800_PIIX4_FCH_PM_ADDR                 0xFED80300
+#define SB800_PIIX4_FCH_PM_SIZE                 8
+
+#define AMD_PCI_SMBUS_REVISION_MMIO             0x59
+
 /* insmod parameters */
 
 /* If force is set to anything different from 0, we forcibly enable the
@@ -155,6 +162,12 @@ static const char *piix4_main_port_names_sb800[PIIX4_MAX_ADAPTERS] = {
 };
 static const char *piix4_aux_port_name_sb800 = " port 1";
 
+struct sb800_mmio_cfg {
+	void __iomem *addr;
+	struct resource *res;
+	bool use_mmio;
+};
+
 struct i2c_piix4_adapdata {
 	unsigned short smba;
 
@@ -162,8 +175,72 @@ struct i2c_piix4_adapdata {
 	bool sb800_main;
 	bool notify_imc;
 	u8 port;		/* Port number, shifted */
+	struct sb800_mmio_cfg mmio_cfg;
 };
 
+static int piix4_sb800_region_setup(struct device *dev,
+				    struct sb800_mmio_cfg *mmio_cfg)
+{
+	if (mmio_cfg->use_mmio) {
+		struct resource *res;
+		void __iomem *addr;
+
+		res = request_mem_region(SB800_PIIX4_FCH_PM_ADDR,
+					 SB800_PIIX4_FCH_PM_SIZE,
+					 "sb800_piix4_smb");
+		if (!res) {
+			dev_err(dev,
+				"SMB base address memory region 0x%x already in use.\n",
+				SB800_PIIX4_FCH_PM_ADDR);
+			return -EBUSY;
+		}
+
+		addr = ioremap(SB800_PIIX4_FCH_PM_ADDR,
+			       SB800_PIIX4_FCH_PM_SIZE);
+		if (!addr) {
+			release_resource(res);
+			dev_err(dev, "SMB base address mapping failed.\n");
+			return -ENOMEM;
+		}
+
+		mmio_cfg->res = res;
+		mmio_cfg->addr = addr;
+	} else {
+		if (!request_muxed_region(SB800_PIIX4_SMB_IDX,
+					  SB800_PIIX4_SMB_MAP_SIZE,
+					  "sb800_piix4_smb")) {
+			dev_err(dev,
+				"SMB base address index region 0x%x already in use.\n",
+				SB800_PIIX4_SMB_IDX);
+			return -EBUSY;
+		}
+	}
+
+	return 0;
+}
+
+static void piix4_sb800_region_release(struct device *dev,
+				       struct sb800_mmio_cfg *mmio_cfg)
+{
+	if (mmio_cfg->use_mmio) {
+		iounmap(mmio_cfg->addr);
+		mmio_cfg->addr = NULL;
+
+		release_resource(mmio_cfg->res);
+		mmio_cfg->res = NULL;
+	} else {
+		release_region(SB800_PIIX4_SMB_IDX,
+			       SB800_PIIX4_SMB_MAP_SIZE);
+	}
+}
+
+static bool piix4_sb800_use_mmio(struct pci_dev *PIIX4_dev)
+{
+	return (PIIX4_dev->vendor == PCI_VENDOR_ID_AMD &&
+		PIIX4_dev->device == PCI_DEVICE_ID_AMD_KERNCZ_SMBUS &&
+		PIIX4_dev->revision >= AMD_PCI_SMBUS_REVISION_MMIO);
+}
+
 static int piix4_setup(struct pci_dev *PIIX4_dev,
 		       const struct pci_device_id *id)
 {
@@ -263,12 +340,58 @@ static int piix4_setup(struct pci_dev *PIIX4_dev,
 	return piix4_smba;
 }
 
+static int piix4_setup_sb800_smba(struct pci_dev *PIIX4_dev,
+				  u8 smb_en,
+				  u8 aux,
+				  u8 *smb_en_status,
+				  unsigned short *piix4_smba)
+{
+	struct sb800_mmio_cfg mmio_cfg;
+	u8 smba_en_lo;
+	u8 smba_en_hi;
+	int retval;
+
+	mmio_cfg.use_mmio = piix4_sb800_use_mmio(PIIX4_dev);
+
+	retval = piix4_sb800_region_setup(&PIIX4_dev->dev, &mmio_cfg);
+	if (retval)
+		return retval;
+
+	if (mmio_cfg.use_mmio) {
+		iowrite32(ioread32(mmio_cfg.addr + 4) | SB800_PIIX4_FCH_PM_DECODEEN_MMIO_EN,
+			  mmio_cfg.addr + 4);
+
+		smba_en_lo = ioread8(mmio_cfg.addr);
+		smba_en_hi = ioread8(mmio_cfg.addr + 1);
+	} else {
+		outb_p(smb_en, SB800_PIIX4_SMB_IDX);
+		smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
+		outb_p(smb_en + 1, SB800_PIIX4_SMB_IDX);
+		smba_en_hi = inb_p(SB800_PIIX4_SMB_IDX + 1);
+	}
+
+	piix4_sb800_region_release(&PIIX4_dev->dev, &mmio_cfg);
+
+	if (!smb_en) {
+		*smb_en_status = smba_en_lo & 0x10;
+		*piix4_smba = smba_en_hi << 8;
+		if (aux)
+			*piix4_smba |= 0x20;
+	} else {
+		*smb_en_status = smba_en_lo & 0x01;
+		*piix4_smba = ((smba_en_hi << 8) | smba_en_lo) & 0xffe0;
+	}
+
+	return retval;
+}
+
 static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
 			     const struct pci_device_id *id, u8 aux)
 {
 	unsigned short piix4_smba;
-	u8 smba_en_lo, smba_en_hi, smb_en, smb_en_status, port_sel;
+	u8 smb_en, smb_en_status, port_sel;
 	u8 i2ccfg, i2ccfg_offset = 0x10;
+	int retval;
 
 	/* SB800 and later SMBus does not support forcing address */
 	if (force || force_addr) {
@@ -290,29 +413,10 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
 	else
 		smb_en = (aux) ? 0x28 : 0x2c;
 
-	if (!request_muxed_region(SB800_PIIX4_SMB_IDX, 2, "sb800_piix4_smb")) {
-		dev_err(&PIIX4_dev->dev,
-			"SMB base address index region 0x%x already in use.\n",
-			SB800_PIIX4_SMB_IDX);
-		return -EBUSY;
-	}
-
-	outb_p(smb_en, SB800_PIIX4_SMB_IDX);
-	smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
-	outb_p(smb_en + 1, SB800_PIIX4_SMB_IDX);
-	smba_en_hi = inb_p(SB800_PIIX4_SMB_IDX + 1);
-
-	release_region(SB800_PIIX4_SMB_IDX, 2);
-
-	if (!smb_en) {
-		smb_en_status = smba_en_lo & 0x10;
-		piix4_smba = smba_en_hi << 8;
-		if (aux)
-			piix4_smba |= 0x20;
-	} else {
-		smb_en_status = smba_en_lo & 0x01;
-		piix4_smba = ((smba_en_hi << 8) | smba_en_lo) & 0xffe0;
-	}
+	retval = piix4_setup_sb800_smba(PIIX4_dev, smb_en,
+					aux, &smb_en_status, &piix4_smba);
+	if (retval)
+		return retval;
 
 	if (!smb_en_status) {
 		dev_err(&PIIX4_dev->dev,
@@ -662,6 +766,28 @@ static void piix4_imc_wakeup(void)
 	release_region(KERNCZ_IMC_IDX, 2);
 }
 
+static int piix4_sb800_port_sel(u8 port, struct sb800_mmio_cfg *mmio_cfg)
+{
+	u8 smba_en_lo;
+
+	if (mmio_cfg->use_mmio) {
+		smba_en_lo = ioread8(mmio_cfg->addr + piix4_port_sel_sb800);
+
+		if ((smba_en_lo & piix4_port_mask_sb800) != port)
+			iowrite8((smba_en_lo & ~piix4_port_mask_sb800) | port,
+				 mmio_cfg->addr + piix4_port_sel_sb800);
+	} else {
+		outb_p(piix4_port_sel_sb800, SB800_PIIX4_SMB_IDX);
+		smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
+
+		if ((smba_en_lo & piix4_port_mask_sb800) != port)
+			outb_p((smba_en_lo & ~piix4_port_mask_sb800) | port,
+			       SB800_PIIX4_SMB_IDX + 1);
+	}
+
+	return (smba_en_lo & piix4_port_mask_sb800);
+}
+
 /*
  * Handles access to multiple SMBus ports on the SB800.
  * The port is selected by bits 2:1 of the smb_en register (0x2c).
@@ -678,12 +804,12 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 	unsigned short piix4_smba = adapdata->smba;
 	int retries = MAX_TIMEOUT;
 	int smbslvcnt;
-	u8 smba_en_lo;
-	u8 port;
+	u8 prev_port;
 	int retval;
 
-	if (!request_muxed_region(SB800_PIIX4_SMB_IDX, 2, "sb800_piix4_smb"))
-		return -EBUSY;
+	retval = piix4_sb800_region_setup(&adap->dev, &adapdata->mmio_cfg);
+	if (retval)
+		return retval;
 
 	/* Request the SMBUS semaphore, avoid conflicts with the IMC */
 	smbslvcnt  = inb_p(SMBSLVCNT);
@@ -738,18 +864,12 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 		}
 	}
 
-	outb_p(piix4_port_sel_sb800, SB800_PIIX4_SMB_IDX);
-	smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
-
-	port = adapdata->port;
-	if ((smba_en_lo & piix4_port_mask_sb800) != port)
-		outb_p((smba_en_lo & ~piix4_port_mask_sb800) | port,
-		       SB800_PIIX4_SMB_IDX + 1);
+	prev_port = piix4_sb800_port_sel(adapdata->port, &adapdata->mmio_cfg);
 
 	retval = piix4_access(adap, addr, flags, read_write,
 			      command, size, data);
 
-	outb_p(smba_en_lo, SB800_PIIX4_SMB_IDX + 1);
+	piix4_sb800_port_sel(prev_port, &adapdata->mmio_cfg);
 
 	/* Release the semaphore */
 	outb_p(smbslvcnt | 0x20, SMBSLVCNT);
@@ -758,7 +878,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 		piix4_imc_wakeup();
 
 release:
-	release_region(SB800_PIIX4_SMB_IDX, 2);
+	piix4_sb800_region_release(&adap->dev, &adapdata->mmio_cfg);
 	return retval;
 }
 
@@ -840,6 +960,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 	adapdata->sb800_main = sb800_main;
 	adapdata->port = port << piix4_port_shift_sb800;
 	adapdata->notify_imc = notify_imc;
+	adapdata->mmio_cfg.use_mmio = piix4_sb800_use_mmio(dev);
 
 	/* set up the sysfs linkage to our parent device */
 	adap->dev.parent = &dev->dev;
-- 
2.25.1

